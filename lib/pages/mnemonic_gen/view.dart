import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MnemonicGenPage extends GetView<MnemonicGenController> {
  const MnemonicGenPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const NavBack().marginOnly(top: Constants.defaultSpaceSize * 7),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text("Mnemonic phrases", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text(
          "Mnemonic phrases allow wallet and health records recovery if your device is lost or damaged. Please Keep the phrase in a safe place for security.",
          style: AppTextStyles.contentText),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Obx(() => MnemonicBox(
          mnemonicPhrase: controller.mnemonicSentence.value,
          renewOnTap: () {
            controller.renewMnemonicSentence();
          })),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => mainCheckboxText(
          text:
              "I understand that mnemonic phrases cannot be recovered by the backend. The backend will not store my mnemonic phrase, and it is my responsibility to keep it safe.",
          checkedValue: controller.checkAcknowledge.value,
          onChanged:
              controller.onCheckAcknowledgeChanged)).marginOnly(
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize * 10),
      Obx(() => mainElevatedButton(
          onPressed:
              controller.checkAcknowledge.value ? controller.onNext : null,
          text: "Next")),
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
      init: MnemonicGenController(),
      builder: (builder) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
