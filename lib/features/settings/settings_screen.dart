import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_bloc.dart';
import 'package:personal_expense_tracker/bloc/expense_bloc/expense_event.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/core/services/notification_services.dart';
import 'package:personal_expense_tracker/core/utilities/custom_dialogs.dart';
import 'package:personal_expense_tracker/features/settings/widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TimeOfDay currentTime = TimeOfDay.now();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SETTINGS',
          style: Theme.of(context).textTheme.bodyMedium!.semiBold.s20.secondary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Column(
          children: [
            SettingsTile(
              icon: Icons.notification_add,
              text: 'Set Reminder',
              onTap: () {
                timePicking(context: context);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            SettingsTile(
              icon: Icons.delete_outlined,
              text: 'Clear App Data',
              onTap: () {
                CustomDialogs().showDeletePopUp(
                    onConfirmed: () {
                      context.read<ExpenseBloc>().add(ClearExpenseDb());
                      Navigator.of(context).pop();
                    },
                    message:
                        "You will lose your all datas!! \n Are you sure to want to Clear?",
                    title: null,
                    context: context);
              },
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  timePicking({required context}) async {
    final TimeOfDay? pickedTIme = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: currentTime,
    );
    if (pickedTIme != null && pickedTIme != currentTime) {
      log(_convertTimeOfDayToDateTime(pickedTIme).toString());
      NotificationService.scheduleNotification(
          0,
          "Scheduled Notification",
          "Don't forget add your Transactions",
          _convertTimeOfDayToDateTime(pickedTIme));
    }
  }

  DateTime _convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }
}
