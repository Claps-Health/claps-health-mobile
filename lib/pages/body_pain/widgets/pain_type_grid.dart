import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class PainTypeGrid extends StatelessWidget {
  const PainTypeGrid(
      {super.key, required this.currentPainType, required this.onPainTypeTap});

  final PainType currentPainType;
  final void Function(PainType painType) onPainTypeTap;

  Widget _buildPainTypeItem(double itemWidth, PainType painType) {
    return Container(
      width: itemWidth,
      height: 36,
      decoration: BoxDecoration(
        color: (painType == currentPainType)
            ? const Color(0xFF456d93)
            : const Color(0xFFd9d9d9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(painType.dispName,
              style: (painType == currentPainType)
                  ? AppTextStyles.smallNoteText
                  : AppTextStyles.normalSmallText)
          .center(),
    ).onTap(() {
      onPainTypeTap(painType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double itemWidth =
          (constraints.maxWidth - (Constants.defaultSpaceSize / 2) * 2) / 3;
      return Wrap(
        spacing: Constants.defaultSpaceSize / 2,
        runSpacing: Constants.defaultSpaceSize / 2,
        children: PainType.values
            .map((painType) => _buildPainTypeItem(itemWidth, painType))
            .toList(),
      );
    });
  }
}
