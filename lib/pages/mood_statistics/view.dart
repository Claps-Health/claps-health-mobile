import 'package:app/common/index.dart';
import 'package:app/pages/mood_statistics/widgets/calendar_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class MoodStatisticsPage extends GetView<MoodStatisticsController> {
  const MoodStatisticsPage({super.key});

  Widget _buildView() {
    return <Widget>[
      const NavBack(iconSize: 30).marginOnly(
          top: Constants.defaultSpaceSize * 5,
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text('Statistics', style: AppTextStyles.headline)
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Obx(() => AppDropdownButton(
            itemTitle: 'Mood Journaling',
            menuItems: controller.intervalList,
            hintText: controller.intervalHint.value,
            onChangeFn: controller.onIntervalChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
            titleBottomMargin: Constants.defaultSpaceSize * 2,
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.monthsCount.value,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  if (index == controller.monthsCount.value - 1) {
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox(
                        width: Constants.defaultSpaceSize * 2);
                  }
                },
                itemBuilder: (context, index) {
                  return Obx(() => FullMoodCalendar(
                        monthTitle: controller.getMonthTitle(index),
                        moodDataRecords:
                            controller.getMoodMonthRecords(index).value,
                      ));
                },
              ))
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .tight(width: Get.width, height: Get.width * 0.72),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('In the last 30 days', style: AppTextStyles.inputTitle)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      Obx(() => ListView.separated(
                itemBuilder: (ctx, index) => FeelingRow(
                    isFirstRow: index == 0,
                    isLastRow:
                        index == controller.feelDaysList.value.length - 1,
                    imgPath: feelingDataMapping[
                            controller.feelDaysList.value[index].feelingType]!
                        .emojiAssetPath,
                    title: feelingDataMapping[
                            controller.feelDaysList.value[index].feelingType]!
                        .title,
                    days: controller.feelDaysList.value[index].days),
                padding: EdgeInsets.zero,
                separatorBuilder: (ctx, index) =>
                    const SizedBox(height: Constants.defaultSpaceSize / 2),
                itemCount: controller.feelDaysList.value.length,
              ))
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .marginOnly(bottom: Constants.defaultSpaceSize * 2)
          .expanded(),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoodStatisticsController>(
      init: MoodStatisticsController(),
      id: "mood_statistics",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
