import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePwdController extends GetxController {
  String mnemonicPhrase = Get.arguments;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdConfirmController = TextEditingController();

  RxBool checkVal1 = false.obs;
  RxBool checkVal2 = false.obs;
  RxBool isReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkIsReady();
    Console.log('[CreatePwdArg]mnemonic: $mnemonicPhrase');

    pwdController.addListener(checkIsReady);
    pwdConfirmController.addListener(checkIsReady);
  }

  void onCheckVal1Changed(bool? val) {
    if (val != null) {
      checkVal1.value = val;
      checkIsReady();
    }
  }

  void onCheckVal2Changed(bool? val) {
    if (val != null) {
      checkVal2.value = val;
      checkIsReady();
    }
  }

  void checkIsReady() {
    isReady.value = checkVal1.value &&
        checkVal2.value &&
        pwdController.text.isNotEmpty &&
        pwdConfirmController.text.isNotEmpty;
  }

  Future<void> onDoneTap() async {
    if ((formKey.currentState as FormState).validate()) {
      Console.log("[PwdForm]validate success");

      Loading.show();
      MnemonicWithKey mnemonicWithKey = await saveMnemonicWithPasscode(
          mnemonicPhrase: mnemonicPhrase, passCodeStr: pwdController.text);
      ConfigService.to.setUserMnemonicWithKey(mnemonicWithKey.toJson());

      bool isSuccess = await RegisterApi.handleNewRegister();
      await Storage().setBool(Constants.registerResultKey, isSuccess);
      Console.log('[RegisterApi] ${isSuccess ? 'success' : 'fail'}');

      await Loading.dismiss();

      Get.offAllNamed(RouteNames.successSignUp);
    }
  }
}
