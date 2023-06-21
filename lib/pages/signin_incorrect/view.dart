import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninIncorrectPage extends GetView<SigninIncorrectController> {
  const SigninIncorrectPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const NavBack().marginOnly(top: Constants.defaultSpaceSize * 7),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text("Sign-In", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 18),
      ExtendedImage.asset(AssetsImages.icon2,
              width: 64, height: 64, fit: BoxFit.cover)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text("Your password is incorrect!", style: AppTextStyles.bigContentText)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 20),
      mainElevatedButton(
        onPressed: () => Get.back(),
        text: "Try Again",
      ).marginOnly(bottom: Constants.defaultSpaceSize * 12),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SigninIncorrectController(),
      builder: (builder) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
