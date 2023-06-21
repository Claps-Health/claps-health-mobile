import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPwdController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mnemonicController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    mnemonicController.addListener(() {
      Console.log(mnemonicController.text
          .replaceAll(RegexUtil.mnemonicMultiLineRegExp, " "));
    });
  }

  Future<void> onSignInTap() async {
    if (formKey.currentState!.validate()) {
      Loading.show();
      try {
        await saveMnemonicWithPasscode(
            mnemonicPhrase: mnemonicController.text
                .replaceAll(RegexUtil.mnemonicMultiLineRegExp, " "),
            passCodeStr: pwdController.text);
        // TODO: add MnemonicWithKey to ConfigService
        // add backend communication logic later
        await Loading.dismiss();
        Get.offAllNamed(RouteNames.backWelcome);
      } catch (e) {
        Console.log(e);
        await Loading.dismiss();
        Get.toNamed(RouteNames.notExist);
      }
    }
  }
}
