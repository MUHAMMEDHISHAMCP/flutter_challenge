import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_event.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_state.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/core/utilities/custom_dialogs.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/expense_tile.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';

@RoutePage()
class ViewAllExpenseScreen extends StatelessWidget {
  const ViewAllExpenseScreen({super.key, required this.expenses});
  final List<ExpenseDataModel> expenses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.black),
          title: Text("ALL EXPENSE",style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .semiBold
                      .s20.latterSpace
                      .black,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ExpenseBloc,ExpenseState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ExpenseLoaded) {
                  return ListView.builder(
                    itemCount: state.expenses.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ExpenseTile(expense: state.expenses[index]);
                    },
                  );
                }
                return const Center(child: Text("No expenses yet..."),);
              }),
        ));
  }
}
