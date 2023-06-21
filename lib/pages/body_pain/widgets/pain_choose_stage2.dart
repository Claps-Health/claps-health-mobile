import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PainTimePeriod {
  startTime,
  endTime,
}

class PainChooseStage2 extends StatelessWidget {
  const PainChooseStage2({
    super.key,
    required this.isOngoingPain,
    required this.onOngoingTap,
    required this.startTimeDisp,
    required this.onStartTimeTap,
    required this.endTimeDisp,
    required this.onEndTimeTap,
    required this.onNextTap,
  });

  final RxBool isOngoingPain;
  final void Function(bool isOngoing) onOngoingTap;
  final RxString startTimeDisp;
  final void Function(DateTime selectedTime) onStartTimeTap;
  final RxString endTimeDisp;
  final void Function(DateTime selectedTime) onEndTimeTap;
  final VoidCallback onNextTap;

  Widget _buildOngoingCell() {
    return Obx(() => Container(
          width: double.infinity,
          height: 44,
          decoration: BoxDecoration(
            color: isOngoingPain.value
                ? const Color(0xFF456d92)
                : const Color(0xFFd9d9d9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Ongoing',
            style: isOngoingPain.value
                ? AppTextStyles.smallWhiteText
                : AppTextStyles.mediumBkText,
          ).center(),
        ).onTap(() {
          if (!isOngoingPain.value) endTimeDisp.value = '';
          onOngoingTap(!isOngoingPain.value);
        }));
  }

  Widget _buildGreyTimeCell(String textInside, PainTimePeriod timePeriod) {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFd9d9d9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        textInside,
        style: AppTextStyles.mediumBkText,
        textAlign: TextAlign.center,
      ).fittedBox().center(),
    ).onTap(() {
      if (timePeriod == PainTimePeriod.endTime && isOngoingPain.value) return;
      DateTime nowTime = DateTime.now();
      (timePeriod == PainTimePeriod.startTime)
          ? onStartTimeTap(nowTime)
          : onEndTimeTap(nowTime);
      showDatetimePicker(
        Get.context!,
        nowTime,
        nowTime,
        (timePeriod == PainTimePeriod.startTime)
            ? onStartTimeTap
            : onEndTimeTap,
      );
    });
  }

  Widget _buildItemRow(String leftTitle, Widget rightItem) {
    return <Widget>[
      Text(leftTitle, style: AppTextStyles.grayMediumText).flexible(flex: 1),
      rightItem.flexible(flex: 1),
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
      Text('Duration', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('The app can automatically calculate the duration of the pain episode based on the start and end times.',
              style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => _buildItemRow(
          'Start Time',
          _buildGreyTimeCell(
              startTimeDisp.value.isEmpty ? 'Start Time' : startTimeDisp.value,
              PainTimePeriod.startTime))).marginSymmetric(
          horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      _buildItemRow('Ongoing Pain', _buildOngoingCell())
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('or', style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Obx(() => _buildItemRow(
              'End Time',
              _buildGreyTimeCell(
                  endTimeDisp.value.isEmpty ? 'End Time' : endTimeDisp.value,
                  PainTimePeriod.endTime)))
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: 100),
      mainElevatedButton(onPressed: onNextTap, text: 'Next')
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
