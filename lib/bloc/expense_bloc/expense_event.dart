import 'package:equatable/equatable.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class GetAllExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final ExpenseDataModel expense;

  const AddExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class UpdateExpense extends ExpenseEvent {
  final ExpenseDataModel expense;

  const UpdateExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class DeleteExpense extends ExpenseEvent {
  final String id;

  const DeleteExpense(this.id);

  @override
  List<Object> get props => [id];
}

class ClearExpenseDb extends ExpenseEvent {}
