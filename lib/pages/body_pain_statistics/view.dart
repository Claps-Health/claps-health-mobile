import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BodyPainStatisticsPage extends GetView<BodyPainStatisticsController> {
  const BodyPainStatisticsPage({super.key});

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
            itemTitle: 'Pain Management',
            menuItems: controller.intervalList,
            hintText: controller.intervalHint.value,
            onChangeFn: controller.onIntervalChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
            titleBottomMargin: Constants.defaultSpaceSize * 2,
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      HumanBody(
              bodyVisibleList: controller.bodyVisibleList,
              onTapBodyPart: controller.onTapBodyPart)
          .alignCenter(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BodyPainStatisticsController>(
      init: BodyPainStatisticsController(),
      id: "body_pain_statistics",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
