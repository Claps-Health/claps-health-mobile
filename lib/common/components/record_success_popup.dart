import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showRecordSuccessPopup() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: WillPopScope(
          onWillPop: () async => false, child: const RecordSuccessCircle()),
    ).marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
    barrierColor: Colors.transparent,
    barrierDismissible: false,
  );
}

class RecordSuccessCircle extends StatelessWidget {
  const RecordSuccessCircle({Key? key}) : super(key: key);

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
        child: _buildInsideStack(),
      ).center();
    });
  }

  Widget _buildInsideStack() {
    return <Widget>[
      Text(
        'Recorded Successfully',
        style: AppTextStyles.emphasizeYellow,
      )
          .fittedBox()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 3)
          .center(),
      ElevatedButton(
              onPressed: () {
                Get.until((route) => Get.currentRoute == RouteNames.main);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text('Back', style: AppTextStyles.mediumTitle)
                  .marginSymmetric(horizontal: Constants.defaultSpaceSize))
          .marginOnly(bottom: Constants.defaultSpaceSize * 4)
          .align(Alignment.bottomCenter)
    ].toStack();
  }
}
