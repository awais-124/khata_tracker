import 'package:flutter/material.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DebtSummary extends StatelessWidget {
  const DebtSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final debtController = context.watch<DebtController>();
    final totalBalance = debtController.totalBalance;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              totalBalance >= 0
                  ? '+₹${totalBalance.toStringAsFixed(2)}'
                  : '-₹${(-totalBalance).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: totalBalance >= 0 ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Unpaid Debts'),
                    Text(
                      debtController.unpaidDebts.length.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Paid Debts'),
                    Text(
                      debtController.paidDebts.length.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Export to PDF',
              icon: Icons.picture_as_pdf,
              onPressed: () {
                // TODO: Implement PDF export
              },
            ),
          ],
        ),
      ),
    );
  }
}
