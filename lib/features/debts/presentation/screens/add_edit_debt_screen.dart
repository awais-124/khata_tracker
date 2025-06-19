import 'package:flutter/material.dart';
import 'package:khata_tracker/core/constants/app_constants.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:khata_tracker/shared/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddEditDebtScreen extends StatefulWidget {
  final Debt? debt;
  const AddEditDebtScreen({super.key, this.debt});

  @override
  State<AddEditDebtScreen> createState() => _AddEditDebtScreenState();
}

class _AddEditDebtScreenState extends State<AddEditDebtScreen> {
  final _formKey = GlobalKey<FormState>();
  final _personController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  final _witnessController = TextEditingController();
  String _type = AppConstants.typeTook;
  DateTime _date = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.debt != null) {
      final debt = widget.debt!;
      _personController.text = debt.person;
      _amountController.text = debt.amount.toString();
      _type = debt.type;
      _date = debt.date;
      _notesController.text = debt.notes ?? '';
      _witnessController.text = debt.witness ?? '';
    }
  }

  @override
  void dispose() {
    _personController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    _witnessController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final debtController = context.read<DebtController>();
      final amount = double.tryParse(_amountController.text) ?? 0;

      final debt = Debt(
        userId: debtController.currentUserId,
        person: _personController.text.trim(),
        type: _type,
        amount: amount,
        date: _date,
        notes:
            _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
        witness:
            _witnessController.text.trim().isEmpty
                ? null
                : _witnessController.text.trim(),
      );

      if (widget.debt != null) {
        debt.id = widget.debt!.id;
        debt.status = widget.debt!.status;
        await debtController.updateDebt(debt);
      } else {
        await debtController.addDebt(debt);
      }

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() => _date = pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.debt == null ? 'Add Debt' : 'Edit Debt',
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                controller: _personController,
                label: 'Person Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter person name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _type,
                      items: const [
                        DropdownMenuItem(
                          value: AppConstants.typeTook,
                          child: Text('I took money'),
                        ),
                        DropdownMenuItem(
                          value: AppConstants.typeGave,
                          child: Text('I gave money'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _type = value);
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Transaction Type',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      controller: _amountController,
                      label: 'Amount',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter valid amount';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: TextEditingController(
                  text: '${_date.day}/${_date.month}/${_date.year}',
                ),
                label: 'Date',
                readOnly: true,
                onTap: _selectDate,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _notesController,
                label: 'Notes (Optional)',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _witnessController,
                label: 'Witness (Optional)',
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: widget.debt == null ? 'Add Debt' : 'Update Debt',
                onPressed: _isLoading ? null : _submit,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
