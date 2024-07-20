import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_state.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/date_time_extention.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key, required this.onButtonPressed,required this.selectedDate});
  final void Function(DateTime) onButtonPressed;
  final DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseBloc, ExpenseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            onTap: () async {
              final selectedDate = await showDatePicker(
                  context: context,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light(
                          primary:
                              AppColor.secondary, // Header background color
                          onPrimary: Colors.white, // Header text color
                          surface:
                              AppColor.primary, // Calendar background color
                          onSurface: Colors.black, // Calendar text color
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 30 * 5)),
                  lastDate: DateTime.now());
              if (selectedDate != null) {
                onButtonPressed(selectedDate);
              }
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 60,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black45)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null ? "Select Date":selectedDate!.simpleDateFormat(),
                      style: TextStyle(color: AppColor.secondary),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.calendar_today,
                        color: AppColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
