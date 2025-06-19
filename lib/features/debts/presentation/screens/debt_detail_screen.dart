import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_tracker/core/constants/app_constants.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/features/debts/presentation/screens/add_edit_debt_screen.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DebtDetailScreen extends StatelessWidget {
  final Debt debt;
  const DebtDetailScreen({super.key, required this.debt});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMMd();
    final timeFormat = DateFormat.jm();

    return AppScaffold(
      title: 'Debt Details',
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditDebtScreen(debt: debt),
              ),
            );
          },
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  debt.person,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  debt.formattedAmount,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: debt.amountColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Type', debt.type.toUpperCase()),
            _buildDetailRow('Date', dateFormat.format(debt.date)),
            _buildDetailRow('Time', timeFormat.format(debt.date)),
            if (debt.dueDate != null)
              _buildDetailRow('Due Date', dateFormat.format(debt.dueDate!)),
            _buildDetailRow('Status', debt.status.toUpperCase()),
            if (debt.witness?.isNotEmpty ?? false)
              _buildDetailRow('Witness', debt.witness!),
            if (debt.notes?.isNotEmpty ?? false) ...[
              const SizedBox(height: 16),
              const Text(
                'Notes:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(debt.notes!),
            ],
            const SizedBox(height: 24),
            if (debt.status == AppConstants.statusUnpaid)
              CustomButton(
                text: 'Mark as Paid',
                onPressed: () async {
                  await context.read<DebtController>().markAsPaid(debt.id!);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
