import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class TwitterPage extends GetView<TwitterController> {
  const TwitterPage({super.key});

  Widget _buildTwitterLinkForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: SingleInputBox(
        isObscureText: false,
        hintTxt: "twitter.com/",
        textEditingController: controller.twitterLinkController,
        textValidator: Validatorless.multiple([
          Validatorless.required('Twitter link is required'),
        ]),
      ),
    );
  }

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "Twitter"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Verified your Twitter account to increase your rewards and Health Points.",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Please post this message to your twitter account",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => GrayMsgDID(content: controller.twitterMsgContent.value)),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      mainElevatedButton(onPressed: controller.openTwitterPost, text: "Post"),
      const SizedBox(height: Constants.defaultSpaceSize * 15),
      Text("Please enter the link to the Twitter post in the field below and click verify.(You may delete post after verified if you wish!)",
              style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      _buildTwitterLinkForm(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      mainElevatedButton(
          onPressed: controller.onVerificationTwitterTap, text: "Verify"),
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TwitterController(),
        builder: (controller) => Scaffold(
              body: _buildBody().gradientBody(),
            ));
  }
}
