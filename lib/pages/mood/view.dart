import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MoodPage extends GetView<MoodController> {
  const MoodPage({super.key});

  Widget _buildMoodWrap() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const double wrapSpacing = Constants.defaultSpaceSize * 2;
      const double wrapRunSpacing = Constants.defaultSpaceSize;
      final double width = (constraints.maxWidth - wrapSpacing * 2) / 3;
      final List<Widget> moodCells = feelingDataMapping.entries
          .map((MapEntry<FeelingType, FeelingModel> entry) {
        return MoodCell(
          cellWidth: width,
          emojiAssetPath: entry.value.emojiAssetPath,
          moodName: entry.value.title,
          onTapAction: () {
            controller.onMoodCellTap(entry.key);
          },
        );
      }).toList();

      return Wrap(
        spacing: wrapSpacing,
        runSpacing: wrapRunSpacing,
        children: moodCells,
      );
    }).marginSymmetric(horizontal: Constants.defaultSpaceSize * 5);
  }

  Widget _buildView() {
    return <Widget>[
      Text("What's your feeling today?", style: AppTextStyles.headline)
          .fittedBox()
          .marginOnly(top: Constants.defaultSpaceSize * 6)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
      _buildMoodWrap(),
      const Spacer(),
      Obx(() => Text('Today\'s Records: ${controller.moodCount.value}',
          style: AppTextStyles.mediumTextContent)).center(),
      const Spacer(),
      Obx(() => Visibility(
            visible: controller.isOkVisible.value,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: mainElevatedButton(onPressed: Get.back, text: 'Back'),
          )).marginSymmetric(horizontal: Constants.defaultSpaceSize * 3),
      const Spacer(),
    ].toColumn(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoodController>(
      init: MoodController(),
      id: "mood",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
