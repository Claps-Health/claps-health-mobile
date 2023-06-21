import 'package:app/common/index.dart';
import 'package:app/pages/mood/widgets/feel_record_circle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoodController extends GetxController {
  RxInt moodCount = 0.obs;
  RxBool isOkVisible = true.obs;

  @override
  void onInit() {
    updateMoodCount();
    super.onInit();
  }

  void onMoodCellTap(FeelingType feelingType) {
    Console.log('[FeelingCellTap] ${feelingType.name}');

    if (moodCount.value < 10) {
      DateTime savedTime = DateTime.now();
      IsarService.to
          .writeMoodRecord(MoodRecord(
            feelingType: feelingType,
            savedTime: savedTime.millisecondsSinceEpoch,
          ))
          .then((value) => updateMoodCount());
      handleMoodRecordApiUpdate(savedTime.millisecondsSinceEpoch, feelingType);
      isOkVisible.value = false;
      showFeelRecordCircle(
          feelType: feelingType,
          timeDisplay: DateFormat('MM/dd a HH:mm').format(savedTime));
    } else {
      Loading.toast('You can only record 10 times a day');
    }
  }

  void updateMoodCount() {
    IsarService.to
        .findSpecificDayMoodCount(DateTime.now())
        .then((int countVal) => moodCount.value = countVal);
  }

  Future<void> handleMoodRecordApiUpdate(int savedTime, FeelingType feelingType) async {
    await AddChallengeRecordApi.handleAddChallengeRecord(ChallengeRecord(
      appId: AppIdType.moodJournal.dispName,
      data: Data(
        app: App(
          time: savedTime,
          timeEnd: null,
          content: Content(savedDetail: {'feelingType': feelingType.name}),
        ),
        blockchain: Blockchain(txid: null),
      ),
    ));
  }
}
