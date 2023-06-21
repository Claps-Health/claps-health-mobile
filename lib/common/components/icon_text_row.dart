import 'package:app/common/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

Widget mainIconTextRow({
  required String imageStr,
  required String titleStr,
  required VoidCallback? onPressed,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      ExtendedImage.asset(imageStr, width: 16, height: 16, fit: BoxFit.cover),
      const SizedBox(width: 4),
      Text(titleStr, style: AppTextStyles.normalSmallText),
    ],
  )
      .padding(
        all: Constants.defaultSpaceSize / 2,
      )
      .inkWell(borderRadius: 8, onTap: onPressed);
}
