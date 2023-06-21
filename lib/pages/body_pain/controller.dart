import 'package:app/common/index.dart';
import 'package:app/pages/body_pain/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BodyPainController extends GetxController {
  List<RxBool> bodyVisibleList = List.generate(13, (index) => false.obs);
  List<BodyParts> bodyPartsList = [
    BodyParts.body,
    BodyParts.head,
    BodyParts.face,
    BodyParts.shoulder,
    BodyParts.upperLimbs,
    BodyParts.abdomen,
    BodyParts.hips,
    BodyParts.arms,
    BodyParts.arms,
    BodyParts.arms,
    BodyParts.arms,
    BodyParts.lowerLimbs,
    BodyParts.lowerLimbs,
  ];
  Rx<BodyParts> selectedBodyPart = Rx<BodyParts>(BodyParts.body);

  // Dialog Page 1 related------------------------------------------------------//
  List<KeyValueModel> get selectedBodyPartList {
    List<KeyValueModel> result = [];
    switch (selectedBodyPart.value) {
      case BodyParts.body:
        result = BodyParts.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.head:
        result = Head.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.face:
        result = Face.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.shoulder:
        result = Shoulder.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.upperLimbs:
        result = UpperLimbs.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.abdomen:
        result = Abdomen.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.hips:
        result = Hips.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.arms:
        result = Arms.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
      case BodyParts.lowerLimbs:
        result = LowerLimbs.values
            .map((element) =>
                KeyValueModel(key: element.dispName, value: element.dispName))
            .toList();
        break;
    }
    return result;
  }

  RxString bodyDetailHint = ''.obs;
  void onDialogSelectPartDetail(KeyValueModel? value) {
    if (value == null) return;
    bodyDetailHint.value = value.key;
  }

  RxDouble bodyPainLevel = 5.0.obs;
  void painSlideCallback(double painVal) {
    Console.log('[PainLevel]: $painVal');
    bodyPainLevel.value = painVal;
  }

  Rx<PainType> selectedPainType = Rx<PainType>(PainType.sharp);
  void onPainTypeTap(PainType painType) {
    selectedPainType.value = painType;
  }

  void onRecordTap() {
    Console.log('[onRecordTap]');
    Get.back();
    createPainDialogPage2();
  }

  void createPainDialogPage1() {
    showPainChooseDialog(PainChooseStage1(
      bodyPartSection: selectedBodyPart.value.dispName,
      dropMenuItems: selectedBodyPartList,
      hintText: bodyDetailHint,
      onChangeFn: onDialogSelectPartDetail,
      painLevel: bodyPainLevel,
      painSlideCallback: painSlideCallback,
      currentPainType: selectedPainType,
      onPainTypeTap: onPainTypeTap,
      onRecordTap: onRecordTap,
    ));
  }
  //----------------------------------------------------------------------------//

  // Dialog Page 2 related------------------------------------------------------//
  RxBool isOngoingPain = false.obs;

  DateTime? startTimeRecord;
  RxString startTimeDisp = ''.obs;

  DateTime? endTimeRecord;
  RxString endTimeDisp = ''.obs;

  void onOngoingTap(bool isOngoing) {
    isOngoingPain.value = isOngoing;
  }

  void onStartTimeTap(DateTime startTime) {
    startTimeRecord = startTime;
    startTimeDisp.value = DateFormat('yyyy-MM-dd\nHH:mm').format(startTime);
  }

  void onEndTimeTap(DateTime endTime) {
    endTimeRecord = endTime;
    endTimeDisp.value = DateFormat('yyyy-MM-dd\nHH:mm').format(endTime);
  }

  void onNextTap() {
    Console.log('[onNextTap]');
    if (startTimeDisp.value.isEmpty ||
        (!isOngoingPain.value && endTimeDisp.value.isEmpty)) {
      Loading.toast('Please select the record time.');
      return;
    }
    Get.back();
    createPainDialogPage3();
  }

  void createPainDialogPage2() {
    showPainChooseDialog(PainChooseStage2(
      isOngoingPain: isOngoingPain,
      onOngoingTap: onOngoingTap,
      startTimeDisp: startTimeDisp,
      onStartTimeTap: onStartTimeTap,
      endTimeDisp: endTimeDisp,
      onEndTimeTap: onEndTimeTap,
      onNextTap: onNextTap,
    ));
  }
  //----------------------------------------------------------------------------//

  // Dialog Page 3 related------------------------------------------------------//
  TextEditingController painIncreaseController = TextEditingController();
  TextEditingController painDecreaseController = TextEditingController();

  void onSubmitTap() {
    Console.log('[onSubmitTap]');
    handleIsarBodyPart();
    handleApiBodyPart();
    Get.back();
    showRecordSuccessPopup();
  }

  void createPainDialogPage3() {
    showPainChooseDialog(PainChooseStage3(
      painIncreaseController: painIncreaseController,
      painDecreaseController: painDecreaseController,
      onSubmitTap: onSubmitTap,
    ));
  }
  //----------------------------------------------------------------------------//

  // Isar for Body Part---------------------------------------------------------//
  void handleIsarBodyPart() {
    BodyPainRecord record = BodyPainRecord(
      clickBodyIndex: currentClickBodyIndex,
      bodySectionPart: selectedBodyPart.value,
      bodyDetailPart: bodyDetailHint.value,
      painLevel: bodyPainLevel.value.roundToDouble(),
      painType: selectedPainType.value,
      startTime: startTimeRecord?.millisecondsSinceEpoch ?? 0,
      isOngoing: isOngoingPain.value,
      endTime: endTimeRecord?.millisecondsSinceEpoch,
      painIncreaseReason: painIncreaseController.text,
      painDecreaseReason: painDecreaseController.text,
    );
    IsarService.to.writeBodyPainRecord(record);
  }

  //----------------------------------------------------------------------------//

  //API update for Body Part-----------------------------------------------------//
  Future<void> handleApiBodyPart() async {
    AddChallengeRecordApi.addChallengeRecord(ChallengeRecord(
      appId: AppIdType.bodyPain.name,
      data: Data(
        app: App(
          time: startTimeRecord?.millisecondsSinceEpoch ?? 0,
          timeEnd: endTimeRecord?.millisecondsSinceEpoch,
          content: Content(savedDetail: {
            'clickBodyIndex': currentClickBodyIndex,
            'bodySectionPart': selectedBodyPart.value.name,
            'bodyDetailPart': bodyDetailHint.value,
            'painLevel': bodyPainLevel.value.roundToDouble(),
            'painType': selectedPainType.value.name,
            'isOngoing': isOngoingPain.value,
            'painIncreaseReason': painIncreaseController.text,
            'painDecreaseReason': painDecreaseController.text,
          }),
        ),
        blockchain: Blockchain(txid: null),
      ),
    ));
  }
  //-----------------------------------------------------------------------------//

  int currentClickBodyIndex = 0;
  void onTapBodyPart(int bodyIdx) {
    currentClickBodyIndex = bodyIdx;
    bodyVisibleList.forEachIndexed((index, value) {
      if (index == bodyIdx) {
        bodyVisibleList[index].value = true;
      } else {
        bodyVisibleList[index].value = false;
      }
    });
    selectedBodyPart.value = bodyPartsList[bodyIdx];
    bodyDetailHint.value = selectedBodyPartList[0].key;
    initResetData();
  }

  void initResetData() {
    bodyPainLevel.value = 5.0;
    selectedPainType.value = PainType.sharp;
    isOngoingPain.value = false;
    startTimeDisp.value = '';
    endTimeDisp.value = '';
    painIncreaseController.text = '';
    painDecreaseController.text = '';
  }

  @override
  void onClose() {
    painIncreaseController.dispose();
    painDecreaseController.dispose();
    super.onClose();
  }
}
