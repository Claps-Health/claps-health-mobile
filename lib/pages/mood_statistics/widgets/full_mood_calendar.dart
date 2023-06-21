import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:app/common/index.dart';
import 'package:get/get.dart';

import 'calendar_dashboard.dart';

class FullMoodCalendar extends StatelessWidget {
  const FullMoodCalendar(
      {super.key, required this.monthTitle, required this.moodDataRecords});

  final String monthTitle;
  final List<MoodRecord?> moodDataRecords; //must be 35 length

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text(monthTitle, style: AppTextStyles.contentText)
          .center()
          .width(Get.width - Constants.defaultSpaceSize * 4.0),
      const SizedBox(height: Constants.defaultSpaceSize * 0.5),
      const WeekdayRow().width(Get.width - Constants.defaultSpaceSize * 4.0),
      const SizedBox(height: Constants.defaultSpaceSize * 0.5),
      CalendarDashboard(moodRecords: moodDataRecords)
          .width(Get.width - Constants.defaultSpaceSize * 4.0),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
