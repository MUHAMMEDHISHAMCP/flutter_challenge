import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/bloc/summary_bloc/summary_bloc.dart';
import 'package:personal_expense_tracker/core/services/get_it.dart';
import 'package:personal_expense_tracker/repository/expense_db_repository.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExpenseBloc>(
          create: (ctx) => ExpenseBloc(
            getIt<ExpenseDbRepository>(),
          ),
        ),
        BlocProvider<SummaryBloc>(
          create: (ctx) => SummaryBloc(
            getIt<ExpenseDbRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
