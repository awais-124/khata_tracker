import 'package:flutter/material.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/features/debts/presentation/screens/debt_detail_screen.dart';
import 'package:khata_tracker/features/debts/presentation/widgets/debt_card.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';
import 'package:provider/provider.dart';

class DebtList extends StatelessWidget {
  final List<Debt> debts;
  const DebtList({super.key, required this.debts});

  @override
  Widget build(BuildContext context) {
    final debtController = context.read<DebtController>();

    return ListView.builder(
      itemCount: debts.length,
      itemBuilder: (context, index) {
        final debt = debts[index];
        return DebtCard(
          debt: debt,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DebtDetailScreen(debt: debt),
              ),
            );
          },
          onDelete: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text('Delete Debt'),
                    content: const Text(
                      'Are you sure you want to delete this debt?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
            );
            if (confirmed == true) {
              await debtController.deleteDebt(debt.id!);
            }
          },
          onMarkPaid: () async {
            await debtController.markAsPaid(debt.id!);
          },
        );
      },
    );
  }
}
