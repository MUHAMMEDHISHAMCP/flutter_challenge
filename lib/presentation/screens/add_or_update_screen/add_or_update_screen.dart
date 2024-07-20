import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_event.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/core/utilities/custom_dialogs.dart';
import 'package:personal_expense_tracker/core/utilities/custom_snackbar_util.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';
import 'package:personal_expense_tracker/presentation/screens/add_or_update_screen/widgets/date_picker_widget.dart';

@RoutePage()
class AddOrUpdateScreen extends StatefulWidget {
  const AddOrUpdateScreen({super.key, this.details, required this.isUpdate});
  final ExpenseDataModel? details;
  final bool isUpdate;
  @override
  _AddOrUpdateScreenState createState() => _AddOrUpdateScreenState();
}

class _AddOrUpdateScreenState extends State<AddOrUpdateScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;
  final List<String> _dropdownOptions = [
    'Food',
    'Travel expenses',
    'Shopping',
    'Others'
  ];

  getDetails() {
    if (widget.isUpdate && widget.details != null) {
      amountController.text = widget.details!.amount.toStringAsFixed(2);
      noteController.text = widget.details!.notes;
      _selectedCategory = widget.details!.category;
      _selectedDate = widget.details!.date;
      setState(() {});
    }
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !widget.isUpdate ? 'Add Expense' : "Edit Expense",
          style: Theme.of(context).textTheme.bodyMedium!.bold.s18.secondary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerWidget(
              selectedDate: _selectedDate,
              onButtonPressed: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            const Gap(16.0),
            TextField(
              cursorColor: AppColor.secondary,
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const Gap(16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Category',
              ),
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: _dropdownOptions.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            const Gap(16.0),
            TextField(
              maxLines: 1,
              maxLength: 20,
              cursorColor: AppColor.secondary,
              controller: noteController,
              decoration: const InputDecoration(
                counterText: "",
                labelText: 'Note',
              ),
            ),
            Gap(16),
            Row(
              children: [
                Visibility(
                  visible: widget.isUpdate,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.redAccent),
                          onPressed: () {
                            CustomDialogs().showDeletePopUp(
                                onConfirmed: () {
                                  Navigator.of(context).pop();

                                  context.read<ExpenseBloc>().add(
                                      DeleteExpense(widget.details?.id ?? ""));

                                  Navigator.of(context).pop();
                                },
                                message: "Are you sure to want to delete ??",
                                title: "Alert !!",
                                context: context);

                            // Handle button press

                            print('Selected Dropdown Option: $_selectedDate');
                          },
                          child: const Text('Delete'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (noteController.text.isEmpty ||
                            amountController.text.isEmpty ||
                            _selectedDate == null ||
                            _selectedCategory == null) {
                          CustomSnackbarUtils.showCustomSnackBar(
                              context: context,
                              message: "Please fill all fields");
                        } else {
                          if (widget.isUpdate && widget.details != null) {
                            context.read<ExpenseBloc>().add(UpdateExpense(
                                ExpenseDataModel(
                                    amount: double.parse(amountController.text),
                                    date: _selectedDate!,
                                    notes: noteController.text,
                                    category: _selectedCategory ?? "",
                                    id: widget.details!.id ?? "")));
                          } else {
                            context
                                .read<ExpenseBloc>()
                                .add(AddExpense(ExpenseDataModel(
                                  amount: double.parse(amountController.text),
                                  date: _selectedDate!,
                                  notes: noteController.text,
                                  category: _selectedCategory ?? "",
                                  id: DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                )));
                          }
                          Navigator.pop(context);
                        }

                        // Handle button press

                        print('Selected Dropdown Option: $_selectedDate');
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
