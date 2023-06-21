import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pwdEditingController = TextEditingController();

  bool get isSignInFromStart {
    if (Get.arguments?[Constants.isSignInFromStartTag] == false) {
      return false;
    } else {
      return true;
    }
  }

  void onForgotPwdTap() {
    Get.toNamed(RouteNames.forgotPwd);
  }

  Future<void> onOkTap() async {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      Loading.show();
      //decrypt
      String decryptedMsg = await getMyData(pwdEditingController.text);

      await Loading.dismiss();
      if (decryptedMsg.isNotEmpty) {
        ConfigService.to.setUserMnemonicWithKey(
            jsonDecode(decryptedMsg) as Map<String, dynamic>);
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.toNamed(RouteNames.signinIncorrect);
      }
    }
  }
}
