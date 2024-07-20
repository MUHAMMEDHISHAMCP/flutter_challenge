import 'package:equatable/equatable.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryLoadingState extends SummaryState {}

class SummaryLoadedState extends SummaryState {
  final List<ExpenseDataModel> todayExpenses;
  final List<ExpenseDataModel> weeklyExpense;
  final List<ExpenseDataModel> monthlyExpenses;
  
  const SummaryLoadedState({required this.todayExpenses,required this.weeklyExpense,required this.monthlyExpenses});

  @override
  List<Object> get props => [todayExpenses,weeklyExpense,monthlyExpenses];
}

class SummaryErrorState extends SummaryState {
  final String message;

  const SummaryErrorState(this.message);

  @override
  List<Object> get props => [message];
}
