import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/bloc/summary_bloc/summary_bloc.dart';
import 'package:personal_expense_tracker/bloc/summary_bloc/summary_event.dart';
import 'package:personal_expense_tracker/bloc/summary_bloc/summary_state.dart';
import 'package:personal_expense_tracker/core/config/app_color.dart';
import 'package:personal_expense_tracker/core/extensions/text_style_extension.dart';
import 'package:personal_expense_tracker/data/local_data_models/expense_model.dart';
import 'package:personal_expense_tracker/features/screens/summary_page/widgets/chart_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    context.read<SummaryBloc>().add(GetAllSummaryDetails());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SummaryBloc,SummaryState>(
        listener: (context, state) {},
        builder: (context, state) {
if (state is SummaryLoadedState) {

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'SUMMARY',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .semiBold
                      .s20
                      .secondary,
                ),
              ),
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 178, 211, 229),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TabBar(
                      tabs: const [
                        Tab(text: 'Today'),
                        Tab(text: 'Weekly'),
                        Tab(text: 'Monthly'),
                      ],
                      indicatorColor: AppColor.secondary,
                      indicatorWeight: 4.0,
                      labelColor: AppColor.primary,
                      unselectedLabelColor: AppColor.black.withOpacity(0.8),
                      labelStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(fontSize: 14.0),
                      indicator: BoxDecoration(
                        color: AppColor.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    
                  ),
                   Expanded(
                    child: TabBarView(
                      children: [
                        ChartView(expenses:state.todayExpenses,),
                        ChartView(expenses:state.weeklyExpense,),
                        ChartView(expenses:state.monthlyExpenses,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  
}else{
 return Center(
                  child: Text(
                    "Something wrong...",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .semiBold
                        .s20
                        .black,
                  ),
                );

}
        });
  }
}

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key, required this.todayExpenses});
  final List<ExpenseDataModel> todayExpenses;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SfCircularChart(
        legend: Legend(isVisible: true),
        series: <CircularSeries>[
          PieSeries<ExpenseDataModel, String>(
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            ),
            dataSource: todayExpenses,
            xValueMapper: (ExpenseDataModel data, _) =>
                data.category,
            yValueMapper: (ExpenseDataModel data, _) =>
                data.amount,
            explode: true,
          )
        ],
      ),
    );
  }
}

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Content for Tab 2'),
    );
  }
}

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Content for Tab 3'),
    );
  }
}
