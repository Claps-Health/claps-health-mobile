import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIDPage extends GetView<MyIDController> {
  const MyIDPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "My ID"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("When you click on \"My ID\" within your Claps Health App Account settings, you will be able to view your unique Decentralized Identifier (DID). Your DID serves as a secure and anonymous identifier within the app, allowing you to interact with various features while maintaining your privacy.",
              style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      Text("Your DID is not directly associated with your personal information, providing an additional layer of privacy and security.",
              style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      Obx(() => controller.myDID.value.isNotEmpty
          ? DidDisp(did: controller.myDID.value)
          : const SizedBox.shrink()),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MyIDController(),
        builder: (controller) => Scaffold(
              body: _buildBody().gradientBody(),
            ));
  }
}
