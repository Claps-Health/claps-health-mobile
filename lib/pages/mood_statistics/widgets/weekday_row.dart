import 'package:flutter/material.dart';
import 'package:app/common/index.dart';
import 'package:get/get.dart';
import '../index.dart';

class WeekdayRow extends StatelessWidget {
  const WeekdayRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const double wrapSpacing = Constants.defaultSpaceSize * 0.5;
      const double wrapRunSpacing = Constants.defaultSpaceSize * 0.5;
      final double cellWidth = (constraints.maxWidth - wrapSpacing * 7.0) / 7.0;
      final List<Widget> weekdayCells =
          WeekdayItem.values.map((WeekdayItem weekday) {
        BorderRadius getItemBorderRadius(WeekdayItem weekday) {
          if (weekday == WeekdayItem.Mon) {
            return const BorderRadius.only(
              topLeft: Radius.circular(Constants.defaultSpaceSize),
            );
          } else if (weekday == WeekdayItem.Sun) {
            return const BorderRadius.only(
              topRight: Radius.circular(Constants.defaultSpaceSize),
            );
          } else {
            return BorderRadius.zero;
          }
        }

        return Container(
          width: cellWidth,
          height: cellWidth * 0.8,
          decoration: BoxDecoration(
            color: const Color(0xFF446c8f),
            borderRadius: getItemBorderRadius(weekday),
          ),
          child: Center(
            child: Text(
              weekday.name,
              style: AppTextStyles.smallNoteText,
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: wrapSpacing,
        runSpacing: wrapRunSpacing,
        children: weekdayCells,
      );
    });
  }
}
