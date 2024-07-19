import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';

class CustomDialogs {
  Future<void> showDeletePopUp(
      {required void Function()? onConfirmed,
      required String message,
      required String? title,
      required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? "Alert !!"),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(alignment: Alignment.topLeft, child: Text(message))
          ]),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel".toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium!.medium.s16.secondary,
              ),
            ),
            ElevatedButton(
              onPressed: onConfirmed,
              child: Text(
                "Ok".toUpperCase(),
                style:
                    Theme.of(context).textTheme.bodyMedium!.bold.s16.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}
