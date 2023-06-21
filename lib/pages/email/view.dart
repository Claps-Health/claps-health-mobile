import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'controller.dart';

class EmailPage extends GetView<EmailController> {
  const EmailPage({super.key});

  Widget _buildEmailForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: SingleInputBox(
        isObscureText: false,
        hintTxt: "Please input your email address",
        textEditingController: controller.emailController,
        textValidator: Validatorless.multiple([
          Validatorless.required('Email is required'),
          Validatorless.email('Invalid email'),
        ]),
      ),
    );
  }

  Widget _buildUnverifiedBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "Email"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Please verify your email address",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      const BlueDotItem(title: "Experience all app functions")
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const BlueDotItem(title: "Receive more airdrop of Health Points")
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 7),
      _buildEmailForm(),
      const SizedBox(height: Constants.defaultSpaceSize * 43),
      mainElevatedButton(
          onPressed: controller.onVerificationLinkTap,
          text: "Send Verification Link"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable();
  }

  Widget _buildVerifiedBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "Email"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Your Email is Verified", style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text(controller.verifiedEmailAddress.value,
              style: AppTextStyles.lightMediumBlueText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("If you want to update your email address, please click update",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const Spacer(),
      mainElevatedButton(
          onPressed: controller.onUpdateEmailTap, text: "Update Email Address"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
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
        init: EmailController(),
        builder: (controller) => Scaffold(
              body: Obx(() => controller.isEmailVerified.value
                  ? _buildVerifiedBody()
                  : _buildUnverifiedBody()).gradientBody(),
            ));
  }
}
