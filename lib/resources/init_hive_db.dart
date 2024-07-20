import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';

class HiveDB {
  static Future<void> initialize() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    if (!Hive.isAdapterRegistered(ExpenseDataModelAdapter().typeId)) {
      Hive.registerAdapter(ExpenseDataModelAdapter());
    }
  }
}