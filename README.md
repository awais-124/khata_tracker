# khata_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

import 'package:flutter/material.dart';
import 'package:khata_tracker/core/constants/app_constants.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:provider/provider.dart';

class DebtFilter extends StatelessWidget {
  const DebtFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final debtController = context.watch<DebtController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: debtController.setSearchQuery,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: debtController.filterStatus.isEmpty,
                onSelected: (_) {
                  debtController.setFilterStatus('');
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Unpaid'),
                selected:
                    debtController.filterStatus == AppConstants.statusUnpaid,
                onSelected: (_) {
                  debtController.setFilterStatus(AppConstants.statusUnpaid);
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Paid'),
                selected:
                    debtController.filterStatus == AppConstants.statusPaid,
                onSelected: (_) {
                  debtController.setFilterStatus(AppConstants.statusPaid);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


The getter 'filterStatus' isn't defined for the type 'DebtController'.
Try importing the library that defines 'filterStatus', correcting the name to the name of an existing getter, or defining a getter or field named 'filterStatus'.dartundefined_getter 