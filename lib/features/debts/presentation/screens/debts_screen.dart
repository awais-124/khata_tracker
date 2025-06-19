import 'package:flutter/material.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/features/debts/presentation/screens/add_edit_debt_screen.dart';
import 'package:khata_tracker/features/debts/presentation/widgets/debt_filter.dart';
import 'package:khata_tracker/features/debts/presentation/widgets/debt_list.dart';
import 'package:khata_tracker/features/debts/presentation/widgets/debt_summary.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DebtsScreen extends StatelessWidget {
  const DebtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'My Debts',
      actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            Navigator.pushNamed(context, '/history');
          },
        ),
      ],
      child: Column(
        children: [
          const DebtSummary(),
          const DebtFilter(),
          Expanded(
            child: Consumer<DebtController>(
              builder: (context, controller, _) {
                if (controller.debts.isEmpty) {
                  return const Center(child: Text('No debts found'));
                }
                return DebtList(debts: controller.debts);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: 'Add New Debt',
              icon: Icons.add,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEditDebtScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
