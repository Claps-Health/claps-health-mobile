import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartContent extends StatelessWidget {
  const BarChartContent({super.key, required this.data});

  final List<AlcoholBarModel> data;

  @override
  Widget build(BuildContext context) {
    // List<AlcoholBarModel> usedData = data.reversed.toList();

    return Container(
      width: double.infinity,
      height: 240,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Constants.defaultSpaceSize * 2),
        ),
      ),
      child: SfCartesianChart(
          primaryXAxis:
              CategoryAxis(labelStyle: AppTextStyles.painLevelGreyText),
          primaryYAxis:
              NumericAxis(labelStyle: AppTextStyles.painLevelGreyText),
          series: <ChartSeries<AlcoholBarModel, String>>[
            BarSeries<AlcoholBarModel, String>(
                dataSource: data,
                width: 0.3,
                xValueMapper: (AlcoholBarModel data, _) => data.month,
                yValueMapper: (AlcoholBarModel data, _) => data.amount,
                color: const Color(0xFFff7e7a))
          ]).marginOnly(
          right: Constants.defaultSpaceSize,
          bottom: Constants.defaultSpaceSize,
          top: Constants.defaultSpaceSize),
    );
  }
}
