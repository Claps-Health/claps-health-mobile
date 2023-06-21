import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class BlueDotItem extends StatelessWidget {
  const BlueDotItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text("• ", style: AppTextStyles.profileItem),
      Text(title, style: AppTextStyles.profileItem).expanded(),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
