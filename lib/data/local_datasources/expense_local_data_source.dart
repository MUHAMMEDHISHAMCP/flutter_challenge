import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense_tracker/data/local_data_models/expense_model.dart';
import 'package:personal_expense_tracker/repository/expense_db_repository.dart';

class ExpenseLocalDataSource implements ExpenseDbRepository {
  final String expenseDbName = 'expense_database';

  ExpenseLocalDataSource._internal();
  static ExpenseLocalDataSource instance = ExpenseLocalDataSource._internal();

  factory ExpenseLocalDataSource() {
    return instance;
  }

  @override
  Future<void> addExpense(ExpenseDataModel expense,) async {
final expenseDb = await Hive.openBox<ExpenseDataModel>(expenseDbName);
    expenseDb.put(expense.id, expense);
  }

  @override
  Future<List<ExpenseDataModel>> getAllExpense() async {
    final expenseDb = await Hive.openBox<ExpenseDataModel>(expenseDbName);
    return expenseDb.values.toList();
  }

  @override
  Future<void> deleteExpense(id,) async {
    final expenseDb = await Hive.openBox<ExpenseDataModel>(expenseDbName);
    await expenseDb.delete(id);
  }

  @override
  Future<void> updateExpense(value,) async {
    final expenseDb = await Hive.openBox<ExpenseDataModel>(expenseDbName);
    await expenseDb.put(value.id, value);
  }

  @override
  Future<void> clearDb() async {
    final expenseDb = await Hive.openBox<ExpenseDataModel>(expenseDbName);
    expenseDb.clear();
  }
}
