import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class InfoItemRow extends StatelessWidget {
  const InfoItemRow(
      {super.key,
      required this.itemTitle,
      required this.buttonText,
      required this.pressCallback});

  final String itemTitle;
  final String buttonText;
  final VoidCallback pressCallback;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Text(itemTitle, style: AppTextStyles.inputTitle),
      const SizedBox(width: Constants.defaultSpaceSize * 2),
      mainElevatedButton(onPressed: pressCallback, text: buttonText).width(250),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
