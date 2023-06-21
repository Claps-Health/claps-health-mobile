import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class ForgotPwdPage extends GetView<ForgotPwdController> {
  const ForgotPwdPage({super.key});

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: <Widget>[
        multiInputBox(
          title: "Please enter your mnemonic phrase to recover your account.",
          textEditingController: controller.mnemonicController,
          textValidator: Validatorless.required("The field is obligatory"),
        ),
        const SizedBox(height: Constants.defaultSpaceSize * 4),
        mainTitleInputBox(
          title: "Create a new password",
          textEditingController: controller.pwdController,
          isObscureText: true,
          textValidator: Validatorless.regex(RegexUtil.pwdRegExp,
              "Password should be at least 8 characters long and include a combination of letters, numbers, and special characters."),
        ),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        mainTitleInputBox(
          title: "Confirm password",
          textEditingController: controller.confirmPwdController,
          isObscureText: true,
          textValidator: Validatorless.compare(
              controller.pwdController, "Passwords do not match"),
        ),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  Widget _buildBody() {
    return <Widget>[
      const NavBack().marginOnly(top: Constants.defaultSpaceSize * 7),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text("Mnemonic Phrases", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      _buildForm(),
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      mainElevatedButton(onPressed: controller.onSignInTap, text: "Sign-In"),
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
      init: ForgotPwdController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
