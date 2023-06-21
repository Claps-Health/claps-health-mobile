import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AlcoholPage extends GetView<AlcoholController> {
  const AlcoholPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return <Widget>[
      const NavBack(iconSize: 30).marginOnly(
          top: Constants.defaultSpaceSize * 5,
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text("Reduce Alcohol", style: AppTextStyles.headline)
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      for (AlcoholType type in AlcoholType.values)
        AlcoholCard(
          alcoholImage: type.imagePath,
          alcoholName: type.alcoholName,
          ccAmountController: controller.getAlcoholCcAmountController(type),
          avgAlcoholPercent: type.avgPercent,
        )
            .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
            .marginOnly(bottom: Constants.defaultSpaceSize * 2),
      const Spacer(),
      mainElevatedButton(onPressed: controller.onRecordTap, text: 'Record')
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .marginOnly(bottom: Constants.defaultSpaceSize * 3),
    ].toColumn(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlcoholController>(
      init: AlcoholController(),
      id: "alcohol",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}
