import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_event.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_state.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/features/screens/add_or_update_screen/add_or_update_screen.dart';
import 'package:personal_expense_tracker/features/screens/home/widgets/expense_tile.dart';
import 'package:personal_expense_tracker/features/screens/home/widgets/home_card_tile.dart';
import 'package:personal_expense_tracker/features/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ExpenseBloc>().add(GetAllExpenses());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.scaffoldbgColor,
        elevation: 0,
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen(),));
          
        }, icon: Icon(Icons.settings,color: AppColor.black,))],
      ),
      body: BlocConsumer<ExpenseBloc, ExpenseState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ExpenseLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.secondary,
                  color: Color.fromARGB(255, 178, 211, 229),
                ),
              );
            }
            if (state is ExpenseLoaded) {
              if (state.expenses.isEmpty) {
                return Center(
                  child: Text(
                    "No expenses yet. Add one now!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .semiBold
                        .s20
                        .black,
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpenseCardTile(
                      totalAmount: state.totalAmount,
                    ),
                    const Gap(16),
                    Text(
                      "Your Expenses",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .extraBold
                          .s19
                          .black,
                    ),
                    const Gap(16),
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.expenses.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddOrUpdateScreen(
                                  details: state.expenses[index],
                                  isUpdate: true,
                                ),
                              ));
                            },
                            child: Dismissible(
                                confirmDismiss: (direction) async {
                                  context.read<ExpenseBloc>().add(DeleteExpense(
                                      state.expenses[index].id ?? ""));
                                  return;
                                },
                                background: Container(
                                  color: AppColor.redAccent,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.all(16),
                                  child: const Icon(Icons.delete_outlined),
                                ),
                                key: const Key(""),
                                child: ExpenseTile(
                                    expense: state.expenses[index])));
                      },
                    ))
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddOrUpdateScreen(
                isUpdate: false,
              ),
            ));
          },
          backgroundColor: AppColor.secondary,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: const Icon(
            Icons.add,
            color: AppColor.primary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
