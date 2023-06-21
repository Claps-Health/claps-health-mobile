import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

TextFormField grayInputBox({
  required TextEditingController textEditingController,
  bool isObscureText = false,
  String? Function(String?)? textValidator,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: isObscureText,
    decoration: const InputDecoration(
      filled: true,
      fillColor: Color(0xFFd9d9d9),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide.none),
      contentPadding:
          EdgeInsets.symmetric(horizontal: Constants.defaultSpaceSize),
      errorMaxLines: 2,
    ),
    validator: textValidator,
  );
}
