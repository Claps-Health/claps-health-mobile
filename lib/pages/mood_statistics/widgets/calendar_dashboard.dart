import 'package:flutter/material.dart';
import 'package:app/common/index.dart';

class CalendarDashboard extends StatelessWidget {
  const CalendarDashboard({super.key, required this.moodRecords});

  final List<MoodRecord?> moodRecords; //must be 35 length

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const double wrapSpacing = Constants.defaultSpaceSize * 0.5;
      const double wrapRunSpacing = Constants.defaultSpaceSize * 0.5;
      final double cellWidth = (constraints.maxWidth - wrapSpacing * 7.0) / 7.0;
      final List<Widget> calendarCells = List.generate(35, (int index) {
        BorderRadius getItemBorderRadius(int idx) {
          if (idx == 29 - 1) {
            // 29 is the index of the last start point of the row
            return const BorderRadius.only(
              bottomLeft: Radius.circular(Constants.defaultSpaceSize),
            );
          } else if (idx == 35 - 1) {
            // 35 is the index of the last end point of the row
            return const BorderRadius.only(
              bottomRight: Radius.circular(Constants.defaultSpaceSize),
            );
          } else {
            return BorderRadius.zero;
          }
        }

        Widget getMoodIcon(int idx) {
          if (moodRecords[idx] != null) {
            return Image.asset(
              feelingDataMapping[moodRecords[idx]!.feelingType]!.emojiAssetPath,
              width: cellWidth * 0.7,
              height: cellWidth * 0.7,
            );
          } else {
            return const SizedBox.shrink();
          }
        }

        return Container(
          width: cellWidth,
          height: cellWidth * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: getItemBorderRadius(index),
          ),
          child: getMoodIcon(index).center(),
        );
      });

      return Wrap(
        spacing: wrapSpacing,
        runSpacing: wrapRunSpacing,
        children: calendarCells,
      );
    });
  }
}
