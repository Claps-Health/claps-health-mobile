import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // 分页管理
  final PageController pageController = PageController();

  // 当前的 tab index
  int currentIndex = 0;

  // 导航栏切换
  void onIndexChanged(int index) {
    currentIndex = index;
    update([MainPage.mainBottomNavKey]);
  }

  // 切换页面
  void onJumpToPage(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void onInit() async {
    super.onInit();
    Console.log(
        "[MnemonicWithKey]${ConfigService.to.mnemonicWithKey?.toJson()}");
    ConfigService.to.myUserDID().then((value) {
      Console.log("[myUserDID]$value");
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
