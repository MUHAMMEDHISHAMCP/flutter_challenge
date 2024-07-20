import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameEditController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LET'S START...",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .extraBold
                        .s26
                        .black,
                  ),
                  const Gap(16),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Image.asset('assets/images/welcome_img.png')),
                  TextFormField(
                    controller: nameEditController,
                    cursorColor: AppColor.secondary,
                    decoration: const InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        label: Text('Enter Your Name')),
                    maxLength: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final pref = await SharedPreferences.getInstance();
                            await pref.setString(
                                'userName', nameEditController.text);
                            context.router.replace(HomeRoute(prefs: pref));
                          }
                        },
                        child: const Text('Start Now')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
