import 'package:personal_expense_tracker/data/local_data_models/expense_model.dart';

abstract class ExpenseDbRepository {
  Future<void> addExpense(
    ExpenseDataModel expense,
  );
  Future<void> deleteExpense(
    String id,
  );
  Future<void> updateExpense(
    ExpenseDataModel expense,
  );
  Future<List<ExpenseDataModel>> getAllExpense();
  Future<void> clearDb();
}
