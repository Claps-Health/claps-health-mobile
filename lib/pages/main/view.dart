import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  static const String mainBottomNavKey = 'mainBottomNavKey';

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (controller) => Scaffold(
              extendBody: true,
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onIndexChanged,
                children: const [
                  // TODO: Switch the order later on
                  HomePage(),
                  FeedbackPage(),
                  ConnectPage(),
                  StatisticsPage(),
                  WalletPage(),
                  AccountPage(),
                ],
              ),
              bottomNavigationBar: GetBuilder<MainController>(
                id: mainBottomNavKey,
                builder: (controller) => BuildNavigation(
                  currentIndex: controller.currentIndex,
                  items: [
                    NavigationItemModel(
                      unselectImg: AssetsImages.navHomeUnselect,
                      selectedImg: AssetsImages.navHomeSelect,
                    ),
                    NavigationItemModel(
                      unselectImg: AssetsImages.feedbackUnselect,
                      selectedImg: AssetsImages.feedbackSelect,
                    ),
                    NavigationItemModel(
                      unselectImg: AssetsImages.connectUnselect,
                      selectedImg: AssetsImages.connectSelect,
                    ),
                    NavigationItemModel(
                      unselectImg: AssetsImages.statisticsUnselect,
                      selectedImg: AssetsImages.statisticsSelect,
                    ),
                    NavigationItemModel(
                      unselectImg: AssetsImages.walletUnselect,
                      selectedImg: AssetsImages.walletSelect,
                    ),
                    NavigationItemModel(
                      unselectImg: AssetsImages.accountUnselect,
                      selectedImg: AssetsImages.accountSelect,
                    ),
                  ],
                  onTap: controller.onJumpToPage, // 切换tab事件
                ),
              ),
            ));
  }
}
