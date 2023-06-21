import 'dart:convert';

import 'package:app/common/index.dart';
import 'package:cryptography/cryptography.dart';

Future<List<int>> sha256WithPassword(String password) async {
  final sha256 = Sha256();
  final passwordHash = await sha256.hash(password.codeUnits);
  return passwordHash.bytes;
}

Future<SecretKey> secretKeyWithPasscode(List<int> sha256Passcode) async {
  final algorithm = AesGcm.with256bits();
  final secretKey = await algorithm.newSecretKeyFromBytes(sha256Passcode);
  return secretKey;
}

Future<SecretBox> encryptMessage(
    String message, SecretKey customSecretKey) async {
  final algorithm = AesGcm.with256bits();
  final secretBox =
      await algorithm.encryptString(message, secretKey: customSecretKey);
  return secretBox;
}

Future<void> saveSecretBoxInfo(SecretBox secretBox, String storageKey) async {
  final Map<String, String> secretBoxMap = secretBox.toMap();
  await Storage().setJson(storageKey, secretBoxMap);
}

Future<SecretBox> getSecretBoxFromStorage(String storageKey) async {
  final Map<String, dynamic> secretBoxMap =
      Storage().getJson(storageKey) as Map<String, dynamic>;
  final SecretBox secretBox = SecretBoxExtension.getFromMap(secretBoxMap);
  return secretBox;
}

Future<String> decryptMessage(
    SecretBox secretBox, SecretKey customSecretKey) async {
  final algorithm = AesGcm.with256bits();

  String clearText = "";
  try {
    clearText =
        await algorithm.decryptString(secretBox, secretKey: customSecretKey);
  } catch (e) {
    Console.log(e);
  }

  return clearText;
}

extension SecretBoxExtension on SecretBox {
  Map<String, String> toMap() {
    return {
      "cipherText": jsonEncode(cipherText),
      "mac": jsonEncode(mac.bytes),
      "nonce": jsonEncode(nonce),
    };
  }

  static SecretBox getFromMap(Map<String, dynamic> map) {
    return SecretBox(
      jsonDecode(map["cipherText"]).cast<int>(),
      nonce: jsonDecode(map["nonce"]).cast<int>(),
      mac: Mac(jsonDecode(map["mac"]).cast<int>()),
    );
  }
}
