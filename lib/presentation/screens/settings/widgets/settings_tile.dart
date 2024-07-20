import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, this.onTap, required this.icon, required this.text});
  final void Function()? onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColor.secondary,
        radius: 15,
        child: Icon(
          Icons.delete_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.medium.s16.black,
      ),
      onTap: onTap,
    );
  }
}
