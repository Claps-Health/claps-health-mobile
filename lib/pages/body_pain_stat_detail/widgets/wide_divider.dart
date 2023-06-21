import 'package:flutter/material.dart';
import 'package:app/common/index.dart';

class WideDivider extends StatelessWidget {
  const WideDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      const Divider(thickness: 1, color: Color(0xFF666666)),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
