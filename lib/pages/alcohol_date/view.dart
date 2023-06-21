import 'package:app/common/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AlcoholDatePage extends GetView<AlcoholDateController> {
  const AlcoholDatePage({super.key});

  Widget _buildDateTimePicker() {
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: CupertinoDatePicker(
          initialDateTime: controller.chosenDateTime, // check this
          onDateTimeChanged: controller.onDateTimeChanged,
        ));
  }

  Widget _buildView() {
    return <Widget>[
      const NavBack(iconSize: 30).marginOnly(
          top: Constants.defaultSpaceSize * 5,
          left: Constants.defaultSpaceSize),
      const SizedBox(height: Constants.defaultSpaceSize),
      Text("Reduce Alcohol", style: AppTextStyles.headline)
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .center(),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text('Please select the date for which you are\nrecording your alcohol consumption.',
              style: AppTextStyles.mediumBkText)
          .fittedBox()
          .center()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      _buildDateTimePicker()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const Spacer(),
      Obx(() => Visibility(
              visible: controller.isSubmitVisible.value,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: mainElevatedButton(
                  onPressed: controller.onSubmitTap, text: 'Submit')))
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
          .marginOnly(bottom: Constants.defaultSpaceSize * 3),
    ].toColumn(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlcoholDateController>(
      init: AlcoholDateController(),
      id: "alcohol_date",
      builder: (_) {
        return Scaffold(
          body: _buildView().gradientBody(),
        );
      },
    );
  }
}
