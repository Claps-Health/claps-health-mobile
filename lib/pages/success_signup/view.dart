import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignupPage extends GetView<SuccessSignupController> {
  const SuccessSignupPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 11),
      Text("Congratulations!", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      Text(
        "You have successfully created your Claps Health App account.",
        style: AppTextStyles.contentText,
      ),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text(
        "Your Digital ID (DID) has been generated and securely stored on your device. You can now use your DID for various interactions within Claps Health App.",
        style: AppTextStyles.contentText,
      ),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text(
        "Remember to keep your mnemonic phrase and password secure.",
        style: AppTextStyles.contentText,
      ),
      const SizedBox(height: Constants.defaultSpaceSize * 8),
      Text(
        "Start exploring the Claps Health App features and services.",
        style: AppTextStyles.inputTitle,
      ),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      mainElevatedButton(
          onPressed: () => Get.offAllNamed(RouteNames.main),
          text: "Go to Home"),
    ]
        .toColumn()
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable()
        .safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SuccessSignupController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
