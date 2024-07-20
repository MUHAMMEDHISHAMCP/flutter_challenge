import 'package:equatable/equatable.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<ExpenseDataModel> expenses;
  final double? totalAmount;

  const ExpenseLoaded(this.expenses,this.totalAmount);

  @override
  List<Object> get props => [expenses];
}

class ExpenseError extends ExpenseState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}
