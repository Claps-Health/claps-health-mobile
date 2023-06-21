import 'package:app/common/values/app_font.dart';
import 'package:flutter/material.dart';

//大標：28px   Futura Heavy   藍字：#456d93
//副標：22px   Futura Bk BT    藍字：#456d93
//按鈕：22px   Futura Heavy    藍底：#456d93       白字：#ffffff
//內文：20px   Futura Bk    深灰字#666666
//input標題：22px    Futura Heavy    深灰字#666666
//勾選框小字：16px    Futura Bk    深灰字#666666

class AppTextStyles {
  static TextStyle headline = const TextStyle(
    fontSize: 28,
    fontFamily: AppFont.heavy,
    color: Color(0xFF456d93),
  );
  static TextStyle mediumTitle = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.heavy,
    color: Color(0xFF456d93),
  );
  static TextStyle subTitle = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.BkBT,
    color: Color(0xFF456d93),
  );
  static TextStyle profileItem = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.Bk,
    color: Color(0xFF456d93),
  );
  static TextStyle lightMediumBlueText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.Bk,
    color: Color(0xFF456d93),
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.heavy,
    color: Color(0xFFffffff),
  );
  static TextStyle smallNoteText = const TextStyle(
    fontSize: 16,
    fontFamily: AppFont.Bk,
    color: Color(0xFFffffff),
  );
  static TextStyle smallWhiteText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.Bk,
    color: Color(0xFFffffff),
  );
  static TextStyle addCardText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.heavy,
    color: Color(0xFFffffff),
  );
  static TextStyle moodOverlayText = const TextStyle(
    fontSize: 24,
    fontFamily: AppFont.Bk,
    color: Color(0xFFFFFFFF),
  );
  static TextStyle moodOverlayHeavy = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.heavy,
    color: Color(0xFFFFFFFF),
  );
  static TextStyle emphasizeYellow = const TextStyle(
    fontSize: 30,
    fontFamily: AppFont.heavy,
    color: Color(0xFFFFFF7A),
  );
  static TextStyle contentText = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle grayMediumText = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.heavy,
    color: Color(0xFF666666),
  );
  static TextStyle mnemonicText = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.heavy,
    color: Color(0xFF898989),
  );
  static TextStyle bigContentText = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.heavy,
    color: Color(0xFF898989),
  );
  static TextStyle inputTitle = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.heavy,
    color: Color(0xFF666666),
  );
  static TextStyle mediumTextContent = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.heavy,
    color: Color(0xFF666666),
  );
  static TextStyle profileGrayText = const TextStyle(
    fontSize: 20,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle mediumHeavyText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.heavy,
    color: Color(0xFF666666),
  );
  static TextStyle mediumBkText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle normalSmallText = const TextStyle(
    fontSize: 16,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle painLevelGreyText = const TextStyle(
    fontSize: 12,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle challengeCardText = const TextStyle(
    fontSize: 25,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle alcoholCardText = const TextStyle(
    fontSize: 24,
    fontFamily: AppFont.Bk,
    color: Color(0xFF666666),
  );
  static TextStyle redSmallText = const TextStyle(
    fontSize: 16,
    fontFamily: AppFont.Bk,
    color: Color(0xFFdd0000),
  );
  static TextStyle redMediumBkText = const TextStyle(
    fontSize: 18,
    fontFamily: AppFont.Bk,
    color: Color(0xFFdd0000),
  );
  static TextStyle redInputTitle = const TextStyle(
    fontSize: 22,
    fontFamily: AppFont.heavy,
    color: Color(0xFFdd0000),
  );
}
