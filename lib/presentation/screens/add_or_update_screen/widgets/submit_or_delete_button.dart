import 'package:flutter/material.dart';

class AddOrDeleteButton extends StatelessWidget {
  const AddOrDeleteButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.padding});
  final String buttonText;
  final Color? buttonColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: padding??EdgeInsets.zero,
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
