import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cc_input.dart';

class AlcoholCard extends StatelessWidget {
  const AlcoholCard({
    super.key,
    required this.alcoholImage,
    required this.alcoholName,
    required this.ccAmountController,
    required this.avgAlcoholPercent,
  });

  final String alcoholImage;
  final String alcoholName;
  final TextEditingController ccAmountController;
  final String avgAlcoholPercent;

  Widget _buildUpperSide() {
    return <Widget>[
      Image.asset(alcoholImage, width: 50, height: 50),
      const SizedBox(width: Constants.defaultSpaceSize),
      Text(alcoholName, style: AppTextStyles.alcoholCardText),
      const Spacer(),
      CcInput(inputController: ccAmountController),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2);
  }

  Widget _buildLowerSide() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFb8b8b8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Text('Average Alcohol: ~$avgAlcoholPercent',
              style: AppTextStyles.smallNoteText)
          .marginOnly(left: Constants.defaultSpaceSize * 2)
          .marginSymmetric(vertical: Constants.defaultSpaceSize / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      _buildUpperSide().expanded(),
      _buildLowerSide(),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        )
        .height(100)
        .card(color: Colors.white, radius: 16);
  }
}
