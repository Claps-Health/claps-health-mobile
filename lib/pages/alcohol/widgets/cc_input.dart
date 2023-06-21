import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CcInput extends StatelessWidget {
  const CcInput({super.key, required this.inputController});
  final TextEditingController inputController;

  Widget _buildInternal() {
    return <Widget>[
      TextField(
        controller: inputController,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
        style: AppTextStyles.mediumBkText.copyWith(fontWeight: FontWeight.bold),
      ).expanded(),
      const SizedBox(width: Constants.defaultSpaceSize),
      Text('cc', style: AppTextStyles.mediumBkText),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFd9d9d9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildInternal(),
    );
  }
}
