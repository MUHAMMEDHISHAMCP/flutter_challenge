import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key,required this.userName});
final String userName;
  @override
  Widget build(BuildContext context) {
    return RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Hi, ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: userName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
  }
}