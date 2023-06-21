import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class BarChartHeader extends StatelessWidget {
  const BarChartHeader({super.key, required this.alcoholType});

  final AlcoholType alcoholType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          color: Color(0xFF456d91),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Constants.defaultSpaceSize * 2),
          )),
      child: <Widget>[
        const SizedBox(width: Constants.defaultSpaceSize),
        Image.asset(alcoholType.imagePath,
            color: Colors.white, width: 42, height: 42, fit: BoxFit.contain),
        const SizedBox(width: Constants.defaultSpaceSize),
        Text(alcoholType.alcoholName, style: AppTextStyles.moodOverlayHeavy),
        const Spacer(),
        Text('Average Alcohol: ~ ${alcoholType.avgPercent}',
            style: AppTextStyles.smallNoteText),
        const SizedBox(width: Constants.defaultSpaceSize),
      ].toRow(),
    );
  }
}
