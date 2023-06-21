import 'package:app/common/index.dart';
import 'package:flutter/material.dart';

Widget multiInputBox({
  required String title,
  required TextEditingController textEditingController,
  required String? Function(String?)? textValidator,
}) {
  return <Widget>[
    Text(title, style: AppTextStyles.contentText),
    const SizedBox(height: Constants.defaultSpaceSize * 2),
    TextFormField(
      controller: textEditingController,
      minLines: 5,
      maxLines: 5,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(
            horizontal: Constants.defaultSpaceSize,
            vertical: Constants.defaultSpaceSize),
      ),
      validator: textValidator,
    )
  ].toColumn(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
  );
}
