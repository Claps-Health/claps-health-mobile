import 'dart:convert';

import 'package:app/common/index.dart';

class JwtRs25519 {
  static const String _jwtHeader = "{\"alg\":\"RS25519\",\"typ\":\"JWT\"}";

  static Future<String> generate() async {
    DateTime now = DateTime.now();
    int notBefore =
        now.subtract(const Duration(seconds: 30)).millisecondsSinceEpoch ~/
            1000;
    int expiresAt =
        now.add(const Duration(days: 90)).millisecondsSinceEpoch ~/ 1000;

    Map<String, dynamic> jwtPayload = {
      "sub": "0x${await ConfigService.to.myUserDID()}",
      "nbf": notBefore,
      "exp": expiresAt,
    };

    String raw =
        "${base64.encode(utf8.encode(_jwtHeader))}.${base64.encode(utf8.encode(jsonEncode(jwtPayload)))}";
    String signature = await CrossPlatformUtils.getSignatureWithMsg(
        raw, ConfigService.to.mnemonicWithKey?.privateKey ?? '');
    return "$raw.${base64.encode(utf8.encode(signature))}";
  }
}
