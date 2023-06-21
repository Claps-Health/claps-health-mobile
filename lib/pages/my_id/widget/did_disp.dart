import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DidDisp extends StatelessWidget {
  const DidDisp({super.key, required this.did});

  final String did;

  @override
  Widget build(BuildContext context) {
    return Text(did, style: AppTextStyles.mediumTextContent)
        .marginAll(Constants.defaultSpaceSize * 2)
        .decorated(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        );
  }
}
