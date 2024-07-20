import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';

class EmptyExpenseWidget extends StatelessWidget {
  const EmptyExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Image.asset('assets/images/empty_data.png'),
          ),
          const Gap(8),
          Text(
            "No expenses yet. Add one now!",
            style: Theme.of(context).textTheme.bodyMedium!.semiBold.s20.black,
          ),
        ],
      ),
    );
  }
}
