import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class NavBackTitle extends StatelessWidget {
  const NavBackTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const NavBack(),
      Text(title, style: AppTextStyles.headline).center(),
    ].toStack();
  }
}
