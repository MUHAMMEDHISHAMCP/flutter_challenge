import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/routes/app_router.gr.dart';

// ignore: must_be_immutable
class ExpenseCardTile extends StatelessWidget {
  const ExpenseCardTile({super.key, this.totalAmount});
  final double? totalAmount;

  getName() async {}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      semanticContainer: true,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.secondary,
              // gradient: const LinearGradient(
              //     colors: [
              //       AppColor.secondary,
              //       Color.fromARGB(255, 230, 139, 211),
              //     ],
              //     begin: FractionalOffset.bottomRight,
              //     end: FractionalOffset.topLeft,
              //     tileMode: TileMode.decal),
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('TOTAL EXPENSE',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .bold
                        .s22
                        .primary),
                const Gap(8),
                Text("£ ${(totalAmount ?? 0.0).toStringAsFixed(2)}",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .extraBold
                        .s20
                        .primary),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CardButoon(
                        iconData: Icons.add,
                        buttonText: "Add Expense",
                        onPressed: () {
                          context.router.push(
                              AddOrUpdateRoute(isUpdate: false, details: null));
                        },
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: CardButoon(
                        iconData: Icons.pie_chart_rounded,
                        buttonText: "Summary",
                        onPressed: () {
                          context.router.push(const SummaryRoute());
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class CardButoon extends StatelessWidget {
  const CardButoon(
      {super.key,
      required this.iconData,
      required this.buttonText,
      this.onPressed});
  final IconData iconData;
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF86BBD8), // Background color
        shadowColor: Colors.black, // Shadow color
        elevation: 5, // Elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
      ),
      icon: Icon(
        iconData,
        color: AppColor.black,
        size: 20,
      ),
      onPressed: onPressed,
      label: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium!.medium.s16.black,
      ),
    );
  }
}
