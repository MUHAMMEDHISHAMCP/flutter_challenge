import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';

class CustomSnackbarUtils {
  static void showCustomSnackBar({ required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(
          message,
           style: Theme.of(context).textTheme.labelLarge!.bold.s16.primary,
        ),
        backgroundColor: AppColor.redAccent,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
