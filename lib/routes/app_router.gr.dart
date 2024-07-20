// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:personal_expense_tracker/data/model/expense_model.dart' as _i10;
import 'package:personal_expense_tracker/presentation/screens/add_or_update_screen/add_or_update_screen.dart'
    as _i1;
import 'package:personal_expense_tracker/presentation/screens/home/home_screen.dart'
    as _i2;
import 'package:personal_expense_tracker/presentation/screens/settings/settings_screen.dart'
    as _i3;
import 'package:personal_expense_tracker/presentation/screens/splash/splash_screen.dart'
    as _i4;
import 'package:personal_expense_tracker/presentation/screens/splash/welcom_screen.dart'
    as _i7;
import 'package:personal_expense_tracker/presentation/screens/summary_page/summary_screen.dart'
    as _i5;
import 'package:personal_expense_tracker/presentation/screens/view_all_screen/view_all_screen.dart'
    as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddOrUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<AddOrUpdateRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddOrUpdateScreen(
          key: args.key,
          details: args.details,
          isUpdate: args.isUpdate,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(
          key: args.key,
          prefs: args.prefs,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
    SummaryRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SummaryScreen(),
      );
    },
    ViewAllExpenseRoute.name: (routeData) {
      final args = routeData.argsAs<ViewAllExpenseRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ViewAllExpenseScreen(
          key: args.key,
          expenses: args.expenses,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddOrUpdateScreen]
class AddOrUpdateRoute extends _i8.PageRouteInfo<AddOrUpdateRouteArgs> {
  AddOrUpdateRoute({
    _i9.Key? key,
    _i10.ExpenseDataModel? details,
    required bool isUpdate,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AddOrUpdateRoute.name,
          args: AddOrUpdateRouteArgs(
            key: key,
            details: details,
            isUpdate: isUpdate,
          ),
          initialChildren: children,
        );

  static const String name = 'AddOrUpdateRoute';

  static const _i8.PageInfo<AddOrUpdateRouteArgs> page =
      _i8.PageInfo<AddOrUpdateRouteArgs>(name);
}

class AddOrUpdateRouteArgs {
  const AddOrUpdateRouteArgs({
    this.key,
    this.details,
    required this.isUpdate,
  });

  final _i9.Key? key;

  final _i10.ExpenseDataModel? details;

  final bool isUpdate;

  @override
  String toString() {
    return 'AddOrUpdateRouteArgs{key: $key, details: $details, isUpdate: $isUpdate}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i9.Key? key,
    required _i11.SharedPreferences prefs,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            prefs: prefs,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<HomeRouteArgs> page =
      _i8.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.prefs,
  });

  final _i9.Key? key;

  final _i11.SharedPreferences prefs;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, prefs: $prefs}';
  }
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SummaryScreen]
class SummaryRoute extends _i8.PageRouteInfo<void> {
  const SummaryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SummaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SummaryRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ViewAllExpenseScreen]
class ViewAllExpenseRoute extends _i8.PageRouteInfo<ViewAllExpenseRouteArgs> {
  ViewAllExpenseRoute({
    _i9.Key? key,
    required List<_i10.ExpenseDataModel> expenses,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ViewAllExpenseRoute.name,
          args: ViewAllExpenseRouteArgs(
            key: key,
            expenses: expenses,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewAllExpenseRoute';

  static const _i8.PageInfo<ViewAllExpenseRouteArgs> page =
      _i8.PageInfo<ViewAllExpenseRouteArgs>(name);
}

class ViewAllExpenseRouteArgs {
  const ViewAllExpenseRouteArgs({
    this.key,
    required this.expenses,
  });

  final _i9.Key? key;

  final List<_i10.ExpenseDataModel> expenses;

  @override
  String toString() {
    return 'ViewAllExpenseRouteArgs{key: $key, expenses: $expenses}';
  }
}

/// generated route for
/// [_i7.WelcomeScreen]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
