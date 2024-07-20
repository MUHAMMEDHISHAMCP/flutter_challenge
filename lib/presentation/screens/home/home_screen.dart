
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_event.dart';
import 'package:personal_expense_tracker/application/expense_bloc/expense_state.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/appbar_text_widget.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/expense_empty_widget.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/expense_tile.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/floating_button_widget.dart';
import 'package:personal_expense_tracker/presentation/screens/home/widgets/home_card_tile.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.prefs});
  final SharedPreferences prefs;
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
          title: AppBarText(userName: widget.prefs.getString("userName") ?? ""),
          backgroundColor: AppColor.scaffoldbgColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  context.router.push(const SettingsRoute()).then(
                    (value) {
                      if (value == true) {
                        context.read<ExpenseBloc>().add(GetAllExpenses());
                      }
                    },
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  color: AppColor.black,
                ))
          ],
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
                  return const EmptyExpenseWidget();
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpenseCardTile(
                        totalAmount: state.totalAmount,
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                          TextButton(
                              onPressed: () {
                                context.router.push(ViewAllExpenseRoute(
                                    expenses: state.expenses));
                              },
                              child: Text(
                                "View All",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .semiBold
                                    .s14
                                    .latterSpace
                                    .secondary,
                              ))
                        ],
                      ),
                      const Gap(16),
                      Expanded(
                          child: ListView.builder(
                        itemCount: state.expenses.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ExpenseTile(expense: state.expenses[index]);
                        },
                      ))
                    ],
                  ),
                );
              }
              return const SizedBox();
            }),
        floatingActionButton: const AddButton());
  }
}
