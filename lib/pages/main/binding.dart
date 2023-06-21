import 'package:app/pages/main/index.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<ConnectController>(() => ConnectController());
    Get.lazyPut<FeedbackController>(() => FeedbackController());
    Get.lazyPut<StatisticsController>(() => StatisticsController());
    Get.lazyPut<WalletController>(() => WalletController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
