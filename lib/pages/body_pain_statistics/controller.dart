import 'package:get/get.dart';
import 'package:app/common/index.dart';

class BodyPainStatisticsController extends GetxController {
  List<KeyValueModel> intervalList = [
    KeyValueModel(key: "1", value: "1 Month"),
    KeyValueModel(key: "3", value: "3 Months"),
  ];

  RxString intervalHint = ''.obs;
  RxInt monthsCount = 1.obs;

  List<RxBool> bodyVisibleList = List.generate(13, (index) => false.obs);

  List<BodyPainRecord> currentBodyPainList = [];

  @override
  void onInit() {
    intervalHint.value = intervalList.first.value;
    updateBodyVisibleList();
    super.onInit();
  }

  void onIntervalChange(KeyValueModel? kv) {
    intervalHint.value = kv?.value ?? "";
    monthsCount.value = int.parse(kv?.key ?? "1");
    updateBodyVisibleList();
  }

  Future<void> updateBodyVisibleList() async {
    DateTime endTime = DateTime.now();
    DateTime startTime =
        DateTime(endTime.year, endTime.month - (monthsCount.value - 1), 1);
    List<BodyPainRecord> bodyPainList = await IsarService.to
        .findSpecificPeriodBodyPainRecords(startTime, endTime);
    currentBodyPainList = bodyPainList;

    List<int> clickedList =
        bodyPainList.map((record) => record.clickBodyIndex).toSet().toList();
    clickedList.sort();
    for (int element in clickedList) {
      bodyVisibleList[element].value = true;
    }
  }

  void onTapBodyPart(int index) {
    if (bodyVisibleList[index].value) {
      Get.toNamed(RouteNames.bodyPainStatDetail,
          arguments: currentBodyPainList
              .where((element) => element.clickBodyIndex == index)
              .toList());
    }
  }
}
