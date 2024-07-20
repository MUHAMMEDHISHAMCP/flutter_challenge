import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/date_time_extention.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});
  final ExpenseDataModel expense;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
        color: AppColor.primary,
        boxShadow: [
                          BoxShadow(
                            color: AppColor.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: const Offset(1, 3),
                          ),
                        ],
      ),
      width: double.infinity,
      child: ListTile(
        leading: const Icon(
          Icons.arrow_circle_down_rounded,
          color: Colors.black,
          size: 30,
        ),
        title: Text(expense.notes,style: Theme.of(context).textTheme.bodyMedium!.semiBold.s16.black,),
        subtitle: Text(expense.date.simpleDateFormat(),style: Theme.of(context).textTheme.bodyMedium!.medium.s14.black,),
        trailing: Text(expense.amount.toStringAsFixed(2),style: Theme.of(context).textTheme.bodyMedium!.medium.s16.black),
      ),
    );
  }
}
