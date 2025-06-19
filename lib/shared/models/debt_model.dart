import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khata_tracker/core/constants/app_constants.dart';

class Debt {
  String? id;
  final String userId;
  final String person;
  final String type;
  final double amount;
  final DateTime date;
  final DateTime? dueDate;
  String status;
  final String? notes;
  final String? witness;

  Debt({
    this.id,
    required this.userId,
    required this.person,
    required this.type,
    required this.amount,
    required this.date,
    this.dueDate,
    this.status = AppConstants.statusUnpaid,
    this.notes,
    this.witness,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'person': person,
      'type': type,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'dueDate': dueDate != null ? Timestamp.fromDate(dueDate!) : null,
      'status': status,
      'notes': notes,
      'witness': witness,
    };
  }

  factory Debt.fromMap(String id, Map<String, dynamic> map) {
    return Debt(
      id: id,
      userId: map['userId'],
      person: map['person'],
      type: map['type'],
      amount: map['amount'].toDouble(),
      date: (map['date'] as Timestamp).toDate(),
      dueDate:
          map['dueDate'] != null
              ? (map['dueDate'] as Timestamp).toDate()
              : null,
      status: map['status'],
      notes: map['notes'],
      witness: map['witness'],
    );
  }

  String get formattedAmount =>
      type == AppConstants.typeGave
          ? '-₹${amount.toStringAsFixed(2)}'
          : '+₹${amount.toStringAsFixed(2)}';

  Color get amountColor =>
      type == AppConstants.typeGave ? Colors.red : Colors.green;

  IconData get typeIcon =>
      type == AppConstants.typeGave ? Icons.arrow_upward : Icons.arrow_downward;
}
