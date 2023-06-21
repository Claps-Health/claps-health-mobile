import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class CreatePwdPage extends GetView<CreatePwdController> {
  const CreatePwdPage({super.key});

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: <Widget>[
        mainTitleInputBox(
          title: "Create a password",
          textEditingController: controller.pwdController,
          isObscureText: true,
          textValidator:
              Validatorless.regex(RegexUtil.pwdRegExp, "Not a valid password"),
        ),
        const SizedBox(height: Constants.defaultSpaceSize * 2),
        mainTitleInputBox(
          title: "Confirm password",
          textEditingController: controller.pwdConfirmController,
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
      Text("Password", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text(
          "Password should be at least 8 charac-\nters long and include a combination of letters, numbers, and special characters.",
          style: AppTextStyles.contentText),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      _buildForm(),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Obx(() => mainCheckboxText(
          text:
              "I understand this password can’t reset without Mnemonic phrases.",
          checkedValue: controller.checkVal1.value,
          onChanged:
              controller.onCheckVal1Changed)).marginOnly(
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => mainCheckboxText(
              text: "The password cannot be recovered by the backend.",
              checkedValue: controller.checkVal2.value,
              onChanged: controller.onCheckVal2Changed))
          .marginOnly(left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => mainElevatedButton(
          onPressed: controller.isReady.value ? controller.onDoneTap : null,
          text: "Done")),
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
        init: CreatePwdController(),
        builder: (controller) => Scaffold(
              body: _buildBody().gradientBody(),
            ));
  }
}
