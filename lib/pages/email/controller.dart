import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  RxBool isEmailVerified = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  RxString verifiedEmailAddress = "test@test.com".obs;

  @override
  void onInit() {
    checkIfEmailVerified();
    super.onInit();
  }

  Future<void> checkIfEmailVerified() async {
    // TODO: get data from API to check if email is verified
    // TODO: update verifiedEmailAddress when email is verified
    // isEmailVerified.value = true;
  }

  void onVerificationLinkTap() {
    if ((formKey.currentState as FormState).validate()) {
      Console.log("[EmailForm]validate success");
      //TODO: send verification link
    }
  }

  void onUpdateEmailTap() {
    isEmailVerified.value = false;
  }
}
