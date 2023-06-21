import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/alcohol_bar_model.dart';
import 'bar_chart_content.dart';
import 'bar_chart_header.dart';

class AlcoholBarChart extends StatelessWidget {
  const AlcoholBarChart(
      {super.key, required this.drinkType, required this.drinkBarList});

  final AlcoholType drinkType;
  final RxList<AlcoholBarModel> drinkBarList;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      BarChartHeader(alcoholType: drinkType),
      Obx(() => BarChartContent(data: drinkBarList.value)),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
