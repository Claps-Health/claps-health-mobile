import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/common/index.dart';

class FeelingRow extends StatelessWidget {
  const FeelingRow(
      {super.key,
      required this.isFirstRow,
      required this.isLastRow,
      required this.imgPath,
      required this.title,
      required this.days});

  final bool isFirstRow;
  final bool isLastRow;
  final String imgPath;
  final String title;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isFirstRow ? 8 : 0),
          bottom: Radius.circular(isLastRow ? 8 : 0),
        ),
      ),
      child: Row(
        children: [
          Image.asset(imgPath, width: 24, height: 24),
          const SizedBox(width: Constants.defaultSpaceSize),
          Text(title, style: AppTextStyles.normalSmallText),
          const Spacer(),
          Text('$days ${days > 1 ? 'days' : 'day'}',
              style: AppTextStyles.normalSmallText),
        ],
      ).marginSymmetric(horizontal: Constants.defaultSpaceSize),
    );
  }
}
