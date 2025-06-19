import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';

class DebtCard extends StatelessWidget {
  final Debt debt;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onMarkPaid;

  const DebtCard({
    super.key,
    required this.debt,
    this.onTap,
    this.onDelete,
    this.onMarkPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    debt.person,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    debt.formattedAmount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: debt.amountColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(debt.typeIcon, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${debt.type.toUpperCase()} • ${DateFormat.yMMMd().format(debt.date)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  if (debt.status == 'paid') ...[
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Colors.green,
                    ),
                  ],
                ],
              ),
              if (debt.notes != null && debt.notes!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(debt.notes!, style: const TextStyle(color: Colors.grey)),
              ],
              if (onDelete != null || onMarkPaid != null) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (onMarkPaid != null && debt.status != 'paid')
                      TextButton(
                        onPressed: onMarkPaid,
                        child: const Text('MARK PAID'),
                      ),
                    if (onDelete != null)
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: onDelete,
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
