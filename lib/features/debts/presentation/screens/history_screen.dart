import 'package:flutter/material.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/features/debts/presentation/widgets/debt_list.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final debtController = context.watch<DebtController>();

    return AppScaffold(
      title: 'History',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Paid Debts',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child:
                debtController.paidDebts.isEmpty
                    ? const Center(child: Text('No paid debts found'))
                    : DebtList(debts: debtController.paidDebts),
          ),
        ],
      ),
    );
  }
}
