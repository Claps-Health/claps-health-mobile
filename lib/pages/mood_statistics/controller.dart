import 'package:app/common/index.dart';
import 'package:app/pages/index.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoodStatisticsController extends GetxController {
  List<KeyValueModel> intervalList = [
    KeyValueModel(key: "1", value: "1 Month"),
    KeyValueModel(key: "3", value: "3 Months"),
  ];

  RxString intervalHint = ''.obs;
  RxInt monthsCount = 1.obs;

  // generate size depends on monthsCount
  List<RxList<MoodRecord?>> moodMonthRecordsRef = List.generate(
      3, (idx) => RxList<MoodRecord?>(List.generate(35, (idx) => null)));

  RxList<FeelDaysModel> feelDaysList = <FeelDaysModel>[].obs;

  @override
  void onInit() {
    intervalHint.value = intervalList.first.value;
    getMoodRecordsInLast30Days();
    super.onInit();
  }

  void onIntervalChange(KeyValueModel? kv) {
    intervalHint.value = kv?.value ?? "";
    monthsCount.value = int.parse(kv?.key ?? "1");
  }

  DateTime getCalculateMonthTime(int index) {
    int startIdx = monthsCount.value - 1;
    DateTime nowTime = DateTime.now();
    return DateTime(nowTime.year, nowTime.month - (startIdx - index), 1);
  }

  String getMonthTitle(int index) {
    DateTime monthTime = getCalculateMonthTime(index);
    return DateFormat('MMM,yyyy').format(monthTime);
  }

  RxList<MoodRecord?> getMoodMonthRecords(int index) {
    int startIdx = monthsCount.value - 1;
    int listRefIdx = startIdx - index;

    getOneMonthMoodRecords(
        getCalculateMonthTime(index), moodMonthRecordsRef[listRefIdx]);
    return moodMonthRecordsRef[listRefIdx];
  }

  Future<void> getOneMonthMoodRecords(
      DateTime monthTime, RxList<MoodRecord?> moodMonthRecords) async {
    int firstDayOfMonth = DateTime(monthTime.year, monthTime.month, 1).weekday;
    int daysInMonth = DateTime(monthTime.year, monthTime.month + 1, 0).day;
    List<MoodRecord?> moodRecords =
        await IsarService.to.findOneMonthMoodRecords(monthTime);

    moodMonthRecords.value = [
      ...List.generate(firstDayOfMonth - 1, (index) => null),
      ...moodRecords,
      ...List.generate(
          35 - daysInMonth - (firstDayOfMonth - 1), (index) => null)
    ];
  }

  //mood records in last 30 days related----------------------------------------
  Future<void> getMoodRecordsInLast30Days() async {
    List<MoodRecord?> last30daysRecord =
        await IsarService.to.find30DaysMoodRecords(DateTime.now());
    Map<FeelingType?, List<MoodRecord?>> last30daysMap = last30daysRecord
        .groupListsBy((MoodRecord? record) => record?.feelingType);
    last30daysMap.removeWhere((key, value) => key == null);
    Console.log('[Last30 days] $last30daysMap');

    feelDaysList.value = last30daysMap.entries
        .map((mapEntry) => FeelDaysModel(
            feelingType: mapEntry.key!, days: mapEntry.value.length))
        .toList();
  }
  //----------------------------------------------------------------------------
}
