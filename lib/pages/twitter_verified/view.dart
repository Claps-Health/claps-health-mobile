import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TwitterVerifiedPage extends GetView<TwitterVerifiedController> {
  const TwitterVerifiedPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "Twitter"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Congratulations! Your Twitter account has been successfully verified.",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const Spacer(),
      mainElevatedButton(
          onPressed: controller.onVerifiedTwitterTap, text: "Verified"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TwitterVerifiedController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
