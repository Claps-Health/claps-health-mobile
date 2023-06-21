import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

Widget mainTitleInputBox({
  required String title,
  required TextEditingController textEditingController,
  bool isObscureText = false,
  String? Function(String?)? textValidator,
}) {
  return <Widget>[
    Text(title, style: AppTextStyles.inputTitle),
    const SizedBox(height: Constants.defaultSpaceSize),
    TextFormField(
      controller: textEditingController,
      obscureText: isObscureText,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        contentPadding:
            EdgeInsets.symmetric(horizontal: Constants.defaultSpaceSize),
        errorMaxLines: 2,
      ),
      validator: textValidator,
    )
  ].toColumn(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
  );
}
