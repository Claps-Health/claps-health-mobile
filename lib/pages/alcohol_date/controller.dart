import 'package:app/common/index.dart';
import 'package:get/get.dart';

class AlcoholDateController extends GetxController {
  DateTime chosenDateTime = DateTime.now();
  RxBool isSubmitVisible = true.obs;

  @override
  void onInit() {
    Console.log('[AlcoholDate] ${Get.arguments}');
    super.onInit();
  }

  void onDateTimeChanged(DateTime newDateTime) {
    chosenDateTime = newDateTime;
  }

  void onSubmitTap() {
    Map<String, double> alcoholReduceAmount =
        Get.arguments as Map<String, double>;
    for (MapEntry<String, double> element in alcoholReduceAmount.entries) {
      if (element.value > 0.0) {
        IsarService.to.writeAlcoholRecord(
          AlcoholRecord(
            alcoholType: AlcoholType.values.byName(element.key),
            amount: element.value,
            savedTime: chosenDateTime.millisecondsSinceEpoch,
          ),
        );
        handleAlcoholRecordApiUpdate(
            AlcoholType.values.byName(element.key),
            element.value,
            chosenDateTime.millisecondsSinceEpoch);
      }
    }
    isSubmitVisible.value = false;
    showRecordSuccessPopup();
  }

  Future<void> handleAlcoholRecordApiUpdate(
      AlcoholType alcoholType, double amount, int savedTime) async {
    await AddChallengeRecordApi.handleAddChallengeRecord(ChallengeRecord(
      appId: AppIdType.reduceAlcohol.dispName,
      data: Data(
        app: App(
          time: savedTime,
          timeEnd: null,
          content: Content(
              savedDetail: {'alcoholType': alcoholType.name, 'amount': amount}),
        ),
        blockchain: Blockchain(txid: null),
      ),
    ));
  }
}
