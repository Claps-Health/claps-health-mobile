import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class GrayDotDescription extends StatelessWidget {
  const GrayDotDescription({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text("• ", style: AppTextStyles.mediumBkText),
      Text(title, style: AppTextStyles.mediumBkText).expanded(),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
