import 'package:app/common/index.dart';
import 'package:get/get.dart';

class MyIDController extends GetxController {
  RxString myDID = ''.obs;

  @override
  void onInit() {
    ConfigService.to.myUserDID().then((didVal) {
      myDID.value = didVal;
    });
    super.onInit();
  }
}
