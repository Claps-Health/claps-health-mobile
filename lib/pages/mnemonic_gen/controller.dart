import 'package:app/common/index.dart';
import 'package:get/get.dart';

class MnemonicGenController extends GetxController {
  RxString mnemonicSentence = ''.obs;
  RxBool checkAcknowledge = false.obs;

  @override
  void onInit() {
    super.onInit();
    renewMnemonicSentence();
  }

  void renewMnemonicSentence() {
    mnemonicSentence.value = generateMnemonicSentence();
  }

  void onCheckAcknowledgeChanged(bool? value) {
    if (value != null) checkAcknowledge.value = value;
  }

  void onNext() {
    Get.toNamed(RouteNames.createPwd, arguments: mnemonicSentence.value);
  }
}
