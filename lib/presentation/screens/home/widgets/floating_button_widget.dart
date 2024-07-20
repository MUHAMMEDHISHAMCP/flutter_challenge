import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 10),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            elevation: 5,
            onPressed: () {
              context.router
                  .push(AddOrUpdateRoute(isUpdate: false, details: null));
            },
            backgroundColor: AppColor.secondary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColor.primary,
                    size: 35,
                  ),
                  Text(
                    "ADD",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .bold
                        .s16
                        .primary,
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}