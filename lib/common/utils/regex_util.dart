abstract class RegexUtil {
  static RegExp pwdRegExp = RegExp(
    r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );
  static RegExp mnemonicMultiLineRegExp = RegExp(r"\s+|\n");
}
