import 'package:get_it/get_it.dart';
import 'package:personal_expense_tracker/data/datasources/expense_local_data_source.dart';
import 'package:personal_expense_tracker/repository/expense_db_repository.dart';

final getIt = GetIt.instance;

void setupLocator()async {
  getIt.registerSingleton<ExpenseDbRepository>(ExpenseLocalDataSource());
  await getIt.allReady();
}