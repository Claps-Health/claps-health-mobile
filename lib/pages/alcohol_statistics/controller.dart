import 'package:get/get.dart';
import 'package:app/common/index.dart';

import 'model/alcohol_bar_model.dart';

class AlcoholStatisticsController extends GetxController {
  List<KeyValueModel> intervalList = [
    KeyValueModel(key: "1", value: "1 Month"),
    KeyValueModel(key: "3", value: "3 Months"),
  ];

  RxString intervalHint = ''.obs;
  RxInt monthsCount = 1.obs;

  //0 -> beer, 1 -> wine, 2 -> spirits
  List<RxList<AlcoholBarModel>> alcoholBarList =
      List.generate(3, (index) => RxList<AlcoholBarModel>());

  @override
  void onInit() {
    intervalHint.value = intervalList.first.value;
    queryAlcoholAmountRecords(monthsCount.value);
    super.onInit();
  }

  void onIntervalChange(KeyValueModel? kv) {
    intervalHint.value = kv?.value ?? "";
    monthsCount.value = int.parse(kv?.key ?? "1");
    queryAlcoholAmountRecords(monthsCount.value);
  }

  Future<void> queryAlcoholAmountRecords(int monthsCount) async {
    for (AlcoholType alcohol in AlcoholType.values) {
      List<AlcoholBarModel> alcoholBarModelList = [];
      for (int i = 0; i < monthsCount; i++) {
        DateTime nowTime = DateTime.now();
        DateTime specificDay = DateTime(nowTime.year, nowTime.month - i, 1);
        AlcoholBarModel alcoholBarModel = await IsarService.to
            .findSpecificAlcoholAmountInOneMonth(specificDay, alcohol);
        alcoholBarModelList.add(alcoholBarModel);
      }
      alcoholBarList[alcohol.index].value = alcoholBarModelList;
    }
  }
}
