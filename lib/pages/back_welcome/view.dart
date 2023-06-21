import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackWelcomePage extends GetView<BackWelcomeController> {
  const BackWelcomePage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 16),
      Text("Welcome Back!", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text(
        "Start exploring the Claps Health App features and services.",
        style: AppTextStyles.bigContentText,
      ),
      const Spacer(),
      mainElevatedButton(
        onPressed: () => Get.offAllNamed(RouteNames.main),
        text: "Go to Home",
      ).marginOnly(bottom: Constants.defaultSpaceSize * 12),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody().gradientBody(),
    );
  }
}
