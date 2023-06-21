import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  RxString myAccountLevelImg = (AssetsImages.level0).obs;
  final TextEditingController deleteAccountPwdEditingController =
      TextEditingController();
  final TextEditingController secretRecoveryPhrasePwdEditingController =
      TextEditingController();

  @override
  void onInit() {
    updateAccountLevelImg();
    super.onInit();
  }

  void updateAccountLevelImg() {
    UserInfoApi.handleUserAccountLevel().then((int level) {
      Console.log('[updateAccountLevelImg]level: $level');
      switch (level) {
        case 1:
          myAccountLevelImg.value = AssetsImages.level1;
          break;
        case 2:
          myAccountLevelImg.value = AssetsImages.level2;
          break;
        case 3:
          myAccountLevelImg.value = AssetsImages.level3;
          break;
        case 4:
          myAccountLevelImg.value = AssetsImages.level4;
          break;
        default:
          myAccountLevelImg.value = AssetsImages.level0;
          break;
      }
    });
  }

  void onViewMyID() {
    Get.toNamed(RouteNames.myId);
  }

  void onUpdateProfile() {
    Get.toNamed(RouteNames.profile);
  }

  void onEmailVerify() {
    Get.toNamed(RouteNames.email);
  }

  void onTwitterVerifyTap() {
    if (Storage().getBool(Constants.isTwitterVerifiedKey)) {
      Get.toNamed(RouteNames.twitterVerified);
    } else {
      Get.toNamed(RouteNames.twitter);
    }
  }

  void onSecretRecoveryPhraseTap() {
    //TODO: Modify words here
    showConfirmInputDialog(
      upperText: "Please Input Password",
      contentText:
          "To view your Secret Recovery Phrase (SRP), please enter your password",
      inputEditingController: secretRecoveryPhrasePwdEditingController,
      isInputObscure: true,
      confirmCallback: goSrpConfirm,
    );
  }

  Future<void> goSrpConfirm() async {
    Loading.show();
    String data =
        await getMyData(secretRecoveryPhrasePwdEditingController.text);

    if (data.isNotEmpty) {
      await Loading.dismiss();
      //TODO: go Secret Recovery Phrase page
      Get.toNamed(RouteNames.secretRecoveryPhrase);
    } else {
      await Loading.dismiss();
      secretRecoveryPhrasePwdEditingController.clear();
      Loading.toast("Password is incorrect");
    }
  }

  Future<void> deleteAccountConfirm() async {
    Loading.show();
    String data = await getMyData(deleteAccountPwdEditingController.text);

    if (data.isNotEmpty) {
      await Storage().clearAll();
      await Loading.dismiss();
      Get.offAllNamed(RouteNames.welcome);
    } else {
      await Loading.dismiss();
      deleteAccountPwdEditingController.clear();
      Loading.toast("Password is incorrect");
    }
  }

  @override
  void onClose() {
    deleteAccountPwdEditingController.dispose();
    secretRecoveryPhrasePwdEditingController.dispose();
    super.onClose();
  }
}
