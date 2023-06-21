import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BodyPainStatDetailPage extends GetView<BodyPainStatDetailController> {
  const BodyPainStatDetailPage({super.key});

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
      Text('Pain Management', style: AppTextStyles.mediumTextContent)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text(controller.bodyPart, style: AppTextStyles.mediumHeavyText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => PainStatisticsContent(
            bodyPainRecord: controller.bodyPainList[index]),
        itemCount: controller.bodyPainList.length,
      ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2).expanded(),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BodyPainStatDetailController>(
      init: BodyPainStatDetailController(),
      id: "body_pain_stat_detail",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
