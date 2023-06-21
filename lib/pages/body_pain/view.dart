import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class BodyPainPage extends GetView<BodyPainController> {
  const BodyPainPage({super.key});

  Widget _buildView() {
    return <Widget>[
      const NavBack(iconSize: 30).marginOnly(
          top: Constants.defaultSpaceSize * 5,
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text("Body Pain Management", style: AppTextStyles.headline)
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text('Please click on the area where you\'re\nexperiencing pain.',
              style: AppTextStyles.mediumBkText)
          .fittedBox()
          .center()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      HumanBody(
              bodyVisibleList: controller.bodyVisibleList,
              onTapBodyPart: controller.onTapBodyPart)
          .alignCenter(),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        )
        .scrollable();
  }

  Widget _buildTouchedBodyTitle() {
    return Obx(() => ElevatedButton(
            onPressed: () => controller.createPainDialogPage1(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(controller.selectedBodyPart.value.dispName,
                style: AppTextStyles.normalSmallText))
        .visibility(controller.selectedBodyPart.value != BodyParts.body));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BodyPainController>(
      init: BodyPainController(),
      id: "body_pain",
      builder: (_) {
        return Scaffold(
          body: <Widget>[
            _buildView(),
            _buildTouchedBodyTitle()
                .positioned(top: 170, left: Get.width * 0.5 + 50),
          ].toStack().gradientBody(),
        );
      },
    );
  }
}
