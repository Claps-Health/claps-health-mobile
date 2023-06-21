import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretRecoveryPhrasePage extends GetView<SecretRecoveryPhraseController> {
  const SecretRecoveryPhrasePage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: ""),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Secret Recovery Phrase", style: AppTextStyles.mediumTextContent)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("This is your Secret Recovery Phrase (SRP). Please make sure to backup your SRP in a secure location, as it provides full access to your wallet and funds.",
              style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      MnemonicWhiteBox(
              mnemonicText: ConfigService.to.mnemonicWithKey?.mnemonic ?? "")
          .onTap(controller.onSrpBoxTap),
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
      init: SecretRecoveryPhraseController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
