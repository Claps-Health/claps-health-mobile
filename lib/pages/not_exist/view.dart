import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotExistPage extends GetView<NotExistController> {
  const NotExistPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const NavBack().marginOnly(top: Constants.defaultSpaceSize * 7),
      const SizedBox(height: Constants.defaultSpaceSize * 25),
      ExtendedImage.asset(AssetsImages.icon2,
              width: 64, height: 64, fit: BoxFit.cover)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text("Your account ID does not exist in Claps Health.",
              style: AppTextStyles.bigContentText)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 25),
      mainElevatedButton(onPressed: () => Get.back(), text: "Back")
          .marginOnly(bottom: Constants.defaultSpaceSize * 12),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotExistController(),
        builder: (builder) => Scaffold(
              body: _buildBody().gradientBody(),
            ));
  }
}
