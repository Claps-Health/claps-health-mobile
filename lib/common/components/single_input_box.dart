import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

class SingleInputBox extends StatelessWidget {
  const SingleInputBox(
      {super.key,
      this.isObscureText = false,
      this.hintTxt,
      required this.textEditingController,
      required this.textValidator});

  final bool isObscureText;
  final String? hintTxt;
  final TextEditingController textEditingController;
  final String? Function(String?)? textValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isObscureText,
      style: AppTextStyles.mediumBkText,
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: AppTextStyles.mediumBkText,
        filled: true,
        fillColor: const Color(0xFFffffff),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Constants.defaultSpaceSize * 2),
        errorMaxLines: 2,
      ),
      validator: textValidator,
    );
  }
}
