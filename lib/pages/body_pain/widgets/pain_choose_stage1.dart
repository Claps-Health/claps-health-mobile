import 'package:app/common/index.dart';
import 'package:app/pages/body_pain/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PainChooseStage1 extends StatelessWidget {
  const PainChooseStage1({
    super.key,
    required this.bodyPartSection,
    required this.dropMenuItems,
    required this.hintText,
    this.onChangeFn,
    required this.painLevel,
    required this.painSlideCallback,
    required this.currentPainType,
    required this.onPainTypeTap,
    required this.onRecordTap,
  });

  final String bodyPartSection;
  final List<KeyValueModel> dropMenuItems;
  final RxString hintText;
  final void Function(KeyValueModel? value)? onChangeFn;

  final RxDouble painLevel;
  final void Function(double painVal) painSlideCallback;

  final Rx<PainType> currentPainType;
  final void Function(PainType painType) onPainTypeTap;

  final VoidCallback onRecordTap;

  Widget _buildSlideLevelIndicator() {
    Widget buildSideIndicator(SideDirection direction) {
      switch (direction) {
        case SideDirection.left:
          return <Widget>[
            Text('1', style: AppTextStyles.grayMediumText),
            Text('Very Mild', style: AppTextStyles.painLevelGreyText),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          );
        case SideDirection.right:
          return <Widget>[
            Text('10', style: AppTextStyles.grayMediumText),
            Text('Unbearable', style: AppTextStyles.painLevelGreyText),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
          );
      }
    }

    return <Widget>[
      buildSideIndicator(SideDirection.left),
      buildSideIndicator(SideDirection.right),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text(bodyPartSection, style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => GreyDropdown(
            menuItems: dropMenuItems,
            hintText: hintText.value,
            onChangeFn: onChangeFn,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 8,
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      const DarkGreyDivider()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Pain Level', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      Obx(() => PainSlider(
            painLevel: painLevel.value,
            onSliderChangeFn: painSlideCallback,
          )),
      _buildSlideLevelIndicator()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      const DarkGreyDivider()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Pain Type', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Obx(() => PainTypeGrid(
            currentPainType: currentPainType.value,
            onPainTypeTap: onPainTypeTap,
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: 100),
      mainElevatedButton(onPressed: onRecordTap, text: 'Record')
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
