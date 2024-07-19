import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:personal_expense_tracker/data/local_data_models/expense_model.dart';
import 'package:personal_expense_tracker/repository/expense_db_repository.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseDbRepository repository;

  ExpenseBloc(this.repository) : super(ExpenseLoading()) {
    on<GetAllExpenses>(_getAllExpense);
    on<AddExpense>(_addExpense);
    on<UpdateExpense>(_updateExpense);
    on<DeleteExpense>(_deleteExpense);
    on<ClearExpenseDb>(_clearDb);
  }

    Future<void> _getAllExpense(
      GetAllExpenses event, Emitter<ExpenseState> emit) async {
    try {
      final expenses = await repository.getAllExpense();
      if (expenses.isNotEmpty) {
        expenses.sort(
          (a, b) => b.date.compareTo(a.date),
        );
        double totalAmount = calculateTotalAmount(expenses);
        emit(ExpenseLoaded(expenses, totalAmount));
      } else {
        emit(ExpenseLoaded(expenses, null));
      }
    } catch (e) {
      log(e.toString());
      emit(const ExpenseError('Failed to load expenses'));
    }
  }

  Future<void> _addExpense(AddExpense event, Emitter<ExpenseState> emit) async {
    try {
      await repository.addExpense(event.expense);
      add(GetAllExpenses());
    } catch (e) {
      log(e.toString());
      emit(const ExpenseError('Failed to add expense'));
    }
  }

  Future<void> _updateExpense(
      UpdateExpense event, Emitter<ExpenseState> emit) async {
    try {
      await repository.updateExpense(event.expense);
      add(GetAllExpenses());
    } catch (e) {
      emit(const ExpenseError('Failed to update expense'));
    }
  }

  Future<void> _deleteExpense(
      DeleteExpense event, Emitter<ExpenseState> emit) async {
    try {
      await repository.deleteExpense(event.id);
      add(GetAllExpenses());
    } catch (e) {
      emit(const ExpenseError('Failed to delete expense'));
    }
  }



  Future<void> _clearDb(
      ClearExpenseDb event, Emitter<ExpenseState> emit) async {
    try {
      await repository.clearDb();
      add(GetAllExpenses());
    } catch (e) {
      emit(const ExpenseError('Failed to clear Db'));
    }
  }

  double calculateTotalAmount(List<ExpenseDataModel> expenses) {
    double totalAmount = 0.0;
    for (var expense in expenses) {
      totalAmount += expense.amount;
    }
    return totalAmount;
  }
}
