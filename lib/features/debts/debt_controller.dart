import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khata_tracker/core/constants/app_constants.dart';
import 'package:khata_tracker/core/constants/firebase_constants.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';

class DebtController with ChangeNotifier {
  final AuthController? _authController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Debt> _debts = [];
  List<Debt> _filteredDebts = [];
  String _searchQuery = '';
  String _filterStatus = AppConstants.statusUnpaid;

  DebtController(this._authController) {
    if (_authController?.isAuthenticated ?? false) {
      _init();
    }
    _authController?.addListener(_onAuthChange);
  }

  // 🔑 Expose current user ID
  String get currentUserId => _authController?.user?.uid ?? '';
  String get filterStatus => _filterStatus;
  List<Debt> get debts => _filteredDebts;

  List<Debt> get unpaidDebts =>
      _debts.where((d) => d.status == AppConstants.statusUnpaid).toList();

  List<Debt> get paidDebts =>
      _debts.where((d) => d.status == AppConstants.statusPaid).toList();

  double get totalBalance => _debts.fold(0, (sum, debt) {
    return debt.type == AppConstants.typeGave
        ? sum - debt.amount
        : sum + debt.amount;
  });

  void _onAuthChange() {
    if (_authController?.isAuthenticated ?? false) {
      _init();
    } else {
      _debts = [];
      _filteredDebts = [];
      notifyListeners();
    }
  }

  void _init() {
    _firestore
        .collection(FirebaseConstants.debtsCollection)
        .where('userId', isEqualTo: currentUserId)
        .orderBy('date', descending: true)
        .snapshots()
        .listen((snapshot) {
          _debts =
              snapshot.docs
                  .map((doc) => Debt.fromMap(doc.id, doc.data()))
                  .toList();
          _applyFilters();
          notifyListeners();
        });
  }

  Future<void> addDebt(Debt debt) async {
    try {
      await _firestore
          .collection(FirebaseConstants.debtsCollection)
          .add(debt.toMap());
    } catch (e) {
      throw 'Failed to add debt: $e';
    }
  }

  Future<void> updateDebt(Debt debt) async {
    try {
      await _firestore
          .collection(FirebaseConstants.debtsCollection)
          .doc(debt.id)
          .update(debt.toMap());
    } catch (e) {
      throw 'Failed to update debt: $e';
    }
  }

  Future<void> deleteDebt(String debtId) async {
    try {
      await _firestore
          .collection(FirebaseConstants.debtsCollection)
          .doc(debtId)
          .delete();
    } catch (e) {
      throw 'Failed to delete debt: $e';
    }
  }

  Future<void> markAsPaid(String debtId) async {
    try {
      await _firestore
          .collection(FirebaseConstants.debtsCollection)
          .doc(debtId)
          .update({'status': AppConstants.statusPaid});
    } catch (e) {
      throw 'Failed to mark debt as paid: $e';
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilters();
    notifyListeners();
  }

  void setFilterStatus(String status) {
    _filterStatus = status;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredDebts =
        _debts.where((debt) {
          final matchesSearch =
              debt.person.toLowerCase().contains(_searchQuery) ||
              (debt.notes != null &&
                  debt.notes!.toLowerCase().contains(_searchQuery));

          final matchesStatus =
              _filterStatus.isEmpty || debt.status == _filterStatus;

          return matchesSearch && matchesStatus;
        }).toList();
  }

  @override
  void dispose() {
    _authController?.removeListener(_onAuthChange);
    super.dispose();
  }
}
