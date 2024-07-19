import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:personal_expense_tracker/data/local_data_models/expense_model.dart';
import 'package:personal_expense_tracker/data/models/chart_data_model.dart';
import 'package:personal_expense_tracker/repository/expense_db_repository.dart';
import 'summary_event.dart';
import 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ExpenseDbRepository repository;

  SummaryBloc(this.repository) : super(SummaryLoadingState()) {
    on<GetAllSummaryDetails>(_getAllExpense);
    // on<DeleteExpense>(_deleteExpense);
  }

  // Future<void> _deleteExpense(
  //     DeleteExpense event, Emitter<SummaryState> emit) async {
  //   try {
  //     await repository.deleteExpense(event.id);
  //     add(GetAllSummaryDetails());
  //   } catch (e) {
  //     emit(const SummaryErrorState('Failed to delete expense'));
  //   }
  // }

  Future<void> _getAllExpense(
      GetAllSummaryDetails event, Emitter<SummaryState> emit) async {
    try {
      final expenses = await repository.getAllExpense();
      if (expenses.isNotEmpty) {
        List<ExpenseDataModel> todayExpense =
            filterExpensesByDay(expenses, DateTime.now());
        List<ExpenseDataModel> weeklyExpense =
            filterExpensesByWeek(expenses, DateTime.now());
        List<ExpenseDataModel> monthlyExpense =
            filterExpensesByMonth(expenses, DateTime.now());
        todayExpense.sort(
          (a, b) => b.amount.compareTo(a.amount),
        );
        weeklyExpense.sort(
          (a, b) => b.amount.compareTo(a.amount),
        );

        monthlyExpense.sort(
          (a, b) => b.amount.compareTo(a.amount),
        );

        emit(SummaryLoadedState(
            todayExpenses: todayExpense,
            weeklyExpense: weeklyExpense,
            monthlyExpenses: monthlyExpense));
      } else {
        emit(const SummaryLoadedState(
            todayExpenses: [], monthlyExpenses: [], weeklyExpense: []));
      }
    } catch (e) {
      log(e.toString());
      emit(const SummaryErrorState('Failed to load expenses'));
    }
  }

  List<ExpenseDataModel> filterExpensesByDay(
      List<ExpenseDataModel> expenses, DateTime day) {
    return expenses.where((expense) => isSameDay(expense.date, day)).toList();
  }

  List<ExpenseDataModel> filterExpensesByWeek(
      List<ExpenseDataModel> expenses, DateTime weekStart) {
    return expenses.where((expense) {
      return expense.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  List<ExpenseDataModel> filterExpensesByMonth(
      List<ExpenseDataModel> expenses, DateTime month) {
    return expenses
        .where((expense) =>
            expense.date.year == month.year &&
            expense.date.month == month.month)
        .toList();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<ChartData> calculateCategoryTotal(List<ExpenseDataModel> expenses) {
    Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      if (categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] =
            categoryTotals[expense.category]! + expense.amount;
      } else {
        categoryTotals[expense.category] = expense.amount;
      }
    }

    return categoryTotals.entries
        .map((entry) => ChartData(categories: entry.key, amount: entry.value))
        .toList();
  }
}
