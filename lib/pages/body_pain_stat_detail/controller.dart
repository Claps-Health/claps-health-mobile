import 'package:get/get.dart';
import 'package:app/common/index.dart';

class BodyPainStatDetailController extends GetxController {
  List<BodyPainRecord> bodyPainList = Get.arguments;
  String bodyPart = '';

  @override
  void onInit() {
    Console.log('[BodyPainStatDetail]args: ${Get.arguments}');
    bodyPart = bodyPainList.first.bodySectionPart.dispName;
    super.onInit();
  }
}
