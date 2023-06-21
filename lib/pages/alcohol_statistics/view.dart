import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AlcoholStatisticsPage extends GetView<AlcoholStatisticsController> {
  const AlcoholStatisticsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      const NavBack(iconSize: 30).marginOnly(
          top: Constants.defaultSpaceSize * 5,
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Statistics', style: AppTextStyles.headline)
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Obx(() => AppDropdownButton(
            itemTitle: 'Alcohol Consumption',
            menuItems: controller.intervalList,
            hintText: controller.intervalHint.value,
            onChangeFn: controller.onIntervalChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
            titleBottomMargin: Constants.defaultSpaceSize * 2,
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      ListView.separated(
        itemCount: 3,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => AlcoholBarChart(
            drinkType: AlcoholType.values[index],
            drinkBarList: controller.alcoholBarList[index]),
        separatorBuilder: (context, index) {
          if (index != 2) {
            return const SizedBox(height: Constants.defaultSpaceSize * 2);
          }
          return const SizedBox.shrink();
        },
      )
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .marginOnly(bottom: Constants.defaultSpaceSize * 2)
          .expanded(),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlcoholStatisticsController>(
      init: AlcoholStatisticsController(),
      id: "alcohol_statistics",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
