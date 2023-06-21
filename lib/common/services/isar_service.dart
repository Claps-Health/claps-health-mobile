import 'dart:io';

import 'package:app/common/index.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../pages/alcohol_statistics/model/alcohol_bar_model.dart';

class IsarService extends GetxService {
  static IsarService get to => Get.find();
  late final Isar isar;

  @override
  Future<void> onInit() async {
    super.onInit();
    await init();
  }

  Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MoodRecordSchema, AlcoholRecordSchema, BodyPainRecordSchema],
      directory: dir.path,
    );
  }

  // MoodRecord related----------------------------------------------------------
  Future<void> writeMoodRecord(MoodRecord record) async {
    await isar.writeTxn(() async {
      await isar.moodRecords.put(record);
    });
  }

  Future<int> findSpecificDayMoodCount(DateTime myTime) async {
    int lower =
        DateTime(myTime.year, myTime.month, myTime.day).millisecondsSinceEpoch;
    int upper = DateTime(myTime.year, myTime.month, myTime.day + 1)
        .millisecondsSinceEpoch;

    return await isar.moodRecords
        .filter()
        .savedTimeBetween(lower, upper, includeLower: true, includeUpper: false)
        .count();
  }

  Future<MoodRecord?> findSpecificDayLastRecord(DateTime specificDay) async {
    int lower = DateTime(specificDay.year, specificDay.month, specificDay.day)
        .millisecondsSinceEpoch;
    int upper =
        DateTime(specificDay.year, specificDay.month, specificDay.day + 1)
            .millisecondsSinceEpoch;

    return await isar.moodRecords
        .filter()
        .savedTimeBetween(lower, upper, includeLower: true, includeUpper: false)
        .sortBySavedTimeDesc()
        .findFirst();
  }

  Future<List<MoodRecord?>> findOneMonthMoodRecords(
      DateTime specificDay) async {
    DateTime lastDayOfMonth =
        DateTime(specificDay.year, specificDay.month + 1, 0);
    int daysInMonth = lastDayOfMonth.day;
    List<MoodRecord?> moodRecords = [];

    for (int i = 0; i < daysInMonth; i++) {
      DateTime oneDay = DateTime(specificDay.year, specificDay.month, i + 1);
      moodRecords.add(await findSpecificDayLastRecord(oneDay));
    }

    return moodRecords;
  }

  Future<List<MoodRecord?>> find30DaysMoodRecords(DateTime specificDay) async {
    List<MoodRecord?> moodRecords = [];

    for (int i = 29; i >= 0; i--) {
      DateTime oneDay =
          DateTime(specificDay.year, specificDay.month, specificDay.day - i);
      moodRecords.add(await findSpecificDayLastRecord(oneDay));
    }

    return moodRecords;
  }
  //---------------------------------------------------------------------------

  // AlcoholRecord related------------------------------------------------------
  Future<void> writeAlcoholRecord(AlcoholRecord record) async {
    await isar.writeTxn(() async {
      await isar.alcoholRecords.put(record);
    });
  }

  Future<AlcoholBarModel> findSpecificAlcoholAmountInOneMonth(
      DateTime specificDay, AlcoholType alcoholType) async {
    int lower =
        DateTime(specificDay.year, specificDay.month, 1).millisecondsSinceEpoch;
    int upper = DateTime(specificDay.year, specificDay.month + 1, 1)
        .millisecondsSinceEpoch;

    double totalAmount = await isar.alcoholRecords
        .filter()
        .alcoholTypeEqualTo(alcoholType)
        .savedTimeBetween(lower, upper, includeLower: true, includeUpper: false)
        .amountProperty()
        .sum();

    return AlcoholBarModel(
        month: DateFormat('MMM').format(specificDay), amount: totalAmount);
  }
  //---------------------------------------------------------------------------

  // BodyPainRecord related-----------------------------------------------------
  Future<void> writeBodyPainRecord(BodyPainRecord record) async {
    await isar.writeTxn(() async {
      await isar.bodyPainRecords.put(record);
    });
  }

  Future<List<BodyPainRecord>> findSpecificPeriodBodyPainRecords(
      DateTime startTime, DateTime endTime) async {
    int lower =
        DateTime(startTime.year, startTime.month, 1).millisecondsSinceEpoch;
    int upper =
        DateTime(endTime.year, endTime.month + 1, 1).millisecondsSinceEpoch;

    return await isar.bodyPainRecords
        .filter()
        .startTimeBetween(lower, upper, includeLower: true, includeUpper: false)
        .sortByStartTime()
        .findAll();
  }
  //---------------------------------------------------------------------------
}
