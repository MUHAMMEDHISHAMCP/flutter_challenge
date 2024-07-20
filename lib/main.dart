import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/services/get_it.dart';
import 'package:personal_expense_tracker/core/services/notification_services.dart';
import 'package:personal_expense_tracker/resources/bloc_providers.dart';
import 'package:personal_expense_tracker/resources/init_hive_db.dart';
import 'package:personal_expense_tracker/resources/light_theme.dart';
import 'package:personal_expense_tracker/routes/app_router.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  tz.initializeTimeZones();
  await HiveDB.initialize();
  setupLocator();
  await getIt.allReady();
  runApp(AppBlocProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppLightTheme.lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
