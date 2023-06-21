import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PainReasonInput extends StatelessWidget {
  const PainReasonInput({super.key, required this.inputController});
  final TextEditingController inputController;

  Widget _buildInternal() {
    return TextField(
      controller: inputController,
      keyboardType: TextInputType.text,
      enableInteractiveSelection: false,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      style: AppTextStyles.mediumBkText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFd9d9d9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildInternal()
          .center()
          .marginSymmetric(horizontal: Constants.defaultSpaceSize),
    );
  }
}
