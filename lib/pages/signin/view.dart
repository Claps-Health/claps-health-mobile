import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({super.key});

  Widget _buildPwdForm() {
    return Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: <Widget>[
          mainTitleInputBox(
            title: "Password",
            textEditingController: controller.pwdEditingController,
            isObscureText: true,
            textValidator:
                Validatorless.required("The password field is obligatory"),
          ),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ));
  }

  Widget _buildBody() {
    return <Widget>[
      controller.isSignInFromStart
          ? const SizedBox(height: Constants.defaultSpaceSize * 12)
          : const NavBack().marginOnly(top: Constants.defaultSpaceSize * 7),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      Text("Sign-In", style: AppTextStyles.headline).center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      _buildPwdForm(),
      const SizedBox(height: Constants.defaultSpaceSize * 1),
      mainIconTextRow(
              imageStr: AssetsImages.icon1,
              titleStr: "Forgot password",
              onPressed: controller.onForgotPwdTap)
          .alignRight(),
      const SizedBox(height: Constants.defaultSpaceSize * 40),
      mainElevatedButton(
        onPressed: controller.onOkTap,
        text: "OK",
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
      init: SigninController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
