import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_expense_tracker/data/datasources/expense_local_data_source.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';
import 'dart:io';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ExpenseLocalDataSource dataSource;
  late Directory tempDir;
  bool isAdapterRegistered = false;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);

    // Register adapter only once
    if (!isAdapterRegistered) {
      Hive.registerAdapter(ExpenseDataModelAdapter());
      isAdapterRegistered = true;
    }
  });

  setUp(() async {
    dataSource = ExpenseLocalDataSource();
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  test('should add an expense to the database', () async {
    final expense = ExpenseDataModel(
        id: '1',
        amount: 100,
        date: DateTime.now(),
        notes: 'Groceries',
        category: 'Travel');

    final expenseDb = await Hive.openBox<ExpenseDataModel>('expense_database');
    await expenseDb.put(expense.id, expense);

    final storedExpense = expenseDb.get(expense.id);
    expect(storedExpense, expense);
  });

  test('should return all expenses from the database', () async {
    final expense = ExpenseDataModel(
        id: '1',
        amount: 100,
        date: DateTime.now(),
        notes: 'Groceries',
        category: 'Travel');
    final expenses = [expense];

    final expenseDb = await Hive.openBox<ExpenseDataModel>('expense_database');
    await expenseDb.put(expense.id, expense);

    final result = await dataSource.getAllExpense();
    expect(result, expenses);
  });

  test('should delete an expense from the database', () async {
    const expenseId = '1';

    final expenseDb = await Hive.openBox<ExpenseDataModel>('expense_database');
    await expenseDb.delete(expenseId);

    final storedExpense = expenseDb.get(expenseId);
    expect(storedExpense, null);
  });

  test('should update an expense in the database', () async {
    final expense = ExpenseDataModel(
        id: '1',
        amount: 150,
        date: DateTime.now(),
        notes: 'Updated Groceries',
        category: 'Travel');

    final expenseDb = await Hive.openBox<ExpenseDataModel>('expense_database');
    await expenseDb.put(expense.id, expense);

    final storedExpense = expenseDb.get(expense.id);
    expect(storedExpense, expense);
  });

  test('should clear all expenses from the database', () async {
    final expenseDb = await Hive.openBox<ExpenseDataModel>('expense_database');
    await expenseDb.clear();

    final result = expenseDb.isEmpty;
    expect(result, true);
  });
}
