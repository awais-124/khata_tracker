import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khata_tracker/core/constants/firebase_constants.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';

class DebtService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Debt>> getDebtsStream(String userId) {
    return _firestore
        .collection(FirebaseConstants.debtsCollection)
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Debt.fromMap(doc.id, doc.data()))
                  .toList(),
        );
  }

  Future<void> addDebt(Debt debt) async {
    await _firestore
        .collection(FirebaseConstants.debtsCollection)
        .add(debt.toMap());
  }

  Future<void> updateDebt(Debt debt) async {
    await _firestore
        .collection(FirebaseConstants.debtsCollection)
        .doc(debt.id)
        .update(debt.toMap());
  }

  Future<void> deleteDebt(String debtId) async {
    await _firestore
        .collection(FirebaseConstants.debtsCollection)
        .doc(debtId)
        .delete();
  }

  Future<void> markAsPaid(String debtId) async {
    await _firestore
        .collection(FirebaseConstants.debtsCollection)
        .doc(debtId)
        .update({'status': 'paid'});
  }
}
