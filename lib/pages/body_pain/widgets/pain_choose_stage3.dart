import 'package:app/common/index.dart';
import 'package:app/pages/body_pain/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PainChooseStage3 extends StatelessWidget {
  const PainChooseStage3(
      {super.key,
      required this.painIncreaseController,
      required this.painDecreaseController,
      required this.onSubmitTap});

  final TextEditingController painIncreaseController;
  final TextEditingController painDecreaseController;
  final VoidCallback onSubmitTap;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('Pain increases with physical activity" or "Pain decreases after rest',
              style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('Pain Increase with', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      PainReasonInput(inputController: painIncreaseController)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('or', style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('Pain Decrease with', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize),
      PainReasonInput(inputController: painDecreaseController)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('or', style: AppTextStyles.mediumBkText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Text('No change', style: AppTextStyles.grayMediumText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: 100),
      mainElevatedButton(onPressed: onSubmitTap, text: 'Submit')
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .scrollable();
  }
}
