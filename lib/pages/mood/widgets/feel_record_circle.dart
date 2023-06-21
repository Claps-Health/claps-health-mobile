import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showFeelRecordCircle({
  required FeelingType feelType,
  required String timeDisplay,
}) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: WillPopScope(
          onWillPop: () async => false,
          child:
              FeelRecordCircle(feelType: feelType, timeDisplay: timeDisplay)),
    ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
    barrierColor: Colors.transparent,
    barrierDismissible: false,
  );
}

class FeelRecordCircle extends StatelessWidget {
  const FeelRecordCircle(
      {super.key, required this.feelType, required this.timeDisplay});

  final FeelingType feelType;
  final String timeDisplay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double itemWidth = constraints.maxWidth;
      return Container(
        width: itemWidth,
        height: itemWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImages.moodBg),
            fit: BoxFit.contain,
          ),
        ),
        child: _buildInsideColumn(feelType, timeDisplay),
      ).center();
    });
  }

  Widget _buildInsideColumn(FeelingType type, String timeDisplay) {
    return <Widget>[
      const Spacer(flex: 3),
      RichText(
          text: TextSpan(
            style: AppTextStyles.moodOverlayText,
            children: <TextSpan>[
              const TextSpan(text: 'You feel '),
              TextSpan(
                text: '${feelingDataMapping[type]!.title} ',
                style: AppTextStyles.emphasizeYellow,
              ),
              const TextSpan(text: 'today.'),
            ],
          ),
          textAlign: TextAlign.center),
      Text('Record completed.', style: AppTextStyles.moodOverlayText),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text(timeDisplay, style: AppTextStyles.moodOverlayHeavy),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      ElevatedButton(
          onPressed: () {
            Get.until((route) => Get.currentRoute == RouteNames.main);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Text('Back', style: AppTextStyles.mediumTitle)
              .marginSymmetric(horizontal: Constants.defaultSpaceSize)),
      const Spacer(flex: 2),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 4);
  }
}
