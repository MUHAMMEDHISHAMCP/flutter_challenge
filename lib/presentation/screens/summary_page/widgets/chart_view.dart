import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:personal_expense_tracker/application/summary_bloc/summary_bloc.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/data/model/expense_model.dart';
import 'package:personal_expense_tracker/data/model/chart_data_model.dart';
import 'package:personal_expense_tracker/presentation/screens/summary_page/widgets/top_spending_tile.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key, required this.expenses});
  final List<ExpenseDataModel> expenses;
  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? Center(
            child: Text(
              "No expenses yet",
              style: Theme.of(context).textTheme.bodyMedium!.semiBold.s20.black,
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfCircularChart(
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.right,
                  shouldAlwaysShowScrollbar: true,
                  textStyle:
                      Theme.of(context).textTheme.bodyMedium!.medium.s14.black,
                ),
                series: <CircularSeries>[
                  PieSeries<ChartData, String>(
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                    dataSource: context
                        .read<SummaryBloc>()
                        .calculateCategoryTotal(expenses),
                    xValueMapper: (ChartData data, _) => data.categories,
                    yValueMapper: (ChartData data, _) => data.amount,
                    explode: true,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Top spending",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .extraBold
                      .s19
                      .black,
                ),
              ),
              const Gap(8),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: expenses.length < 3 ? expenses.length : 2,
                  itemBuilder: (context, index) {
                    return TopSpendingTile(
                      expense: expenses[index],
                    );
                  },
                ),
              )
            ],
          );
  }
}
