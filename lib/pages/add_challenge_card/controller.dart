import 'package:get/get.dart';

class AddChallengeCardController extends GetxController {
  AddChallengeCardController();

  _initData() {
    update(["add_challenge_card"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
