import 'package:app/common/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class GetStartedPage extends GetView<GetStartedController> {
  const GetStartedPage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 14),
      Text('Let\'s Get Started',
              style: AppTextStyles.headline, textAlign: TextAlign.center)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      Text('New to Claps Health App? Create an account to get started.',
          style: AppTextStyles.contentText),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      mainElevatedButton(
        onPressed: () => Get.toNamed(RouteNames.mnemonicGen),
        text: 'New User Sign-Up',
      ),
      const Spacer(),
      RichText(
        text: TextSpan(
          style: AppTextStyles.contentText,
          children: <TextSpan>[
            const TextSpan(
                text:
                    'Already have an account? Access your health records and services. Or '),
            TextSpan(
              text: 'Recover Account.',
              style: const TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Console.log('[Recover Account Clicked]');
                  Get.toNamed(RouteNames.forgotPwd);
                },
            ),
          ],
        ),
      ),
      const SizedBox(height: Constants.defaultSpaceSize * 4),
      mainElevatedButton(
              onPressed: () => Get.toNamed(RouteNames.signin,
                  arguments: {Constants.isSignInFromStartTag: false}),
              text: 'Sign-In')
          .marginOnly(bottom: Constants.defaultSpaceSize * 16),
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
        init: GetStartedController(),
        builder: (controller) => Scaffold(
              body: _buildBody().gradientBody(),
            ));
  }
}
