import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/view_models/account_statistics_view_model.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/graph_chart.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/month_labels_row.dart';

class GraphSection extends ConsumerWidget {
  const GraphSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final viewModel = ref.read(selectedMonthProvider.notifier);
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          const Expanded(child: GraphChart()),
          const SizedBox(height: 8),
          MonthLabelsRow(
            selectedMonthKey: selectedMonth,
            onMonthSelected: viewModel.selectMonth,
          ),
        ],
      ),
    );
  }
}