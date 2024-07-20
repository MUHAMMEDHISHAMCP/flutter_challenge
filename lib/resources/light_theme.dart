import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';

class AppLightTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColor.primary,
        iconTheme: IconThemeData(color: AppColor.secondary),
      ),
      scaffoldBackgroundColor: AppColor.scaffoldbgColor,
      dialogBackgroundColor: AppColor.primary,
      primaryIconTheme: const IconThemeData(color: AppColor.black),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        linearMinHeight: 9,
        color: AppColor.secondary,
        linearTrackColor: AppColor.secondary,
        circularTrackColor: AppColor.secondary,
        refreshBackgroundColor: AppColor.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.secondary,
          // Button background color
        ),
      ),
      primaryColor: AppColor.primary,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.primary,
        selectionColor: AppColor.primary.withOpacity(0.4),
        selectionHandleColor: AppColor.primary,
      ),
      fontFamily: 'Roboto',
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColor.secondary,
        secondary: AppColor.secondary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hoverColor: AppColor.secondary,
        labelStyle: TextStyle(color: AppColor.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.secondary, // Color when the TextField is focused
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor
                .shadowColor, // Color when the TextField is enabled but not focused
            width: 1.0,
          ),
        ),
      ),
      useMaterial3: false);
}
