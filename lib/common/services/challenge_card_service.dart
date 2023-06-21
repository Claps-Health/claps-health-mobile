import 'package:app/common/index.dart';
import 'package:get/get.dart';

class ChallengeCardService extends GetxService {
  static ChallengeCardService get to => Get.find();

  RxList<ChallengeCardType> challengeCardList = <ChallengeCardType>[].obs;

  @override
  void onInit() {
    super.onInit();
    challengeCardList.value = initChallengeCardList();
    Console.log('[ChallengeCardService]init: $challengeCardList');
  }
}
