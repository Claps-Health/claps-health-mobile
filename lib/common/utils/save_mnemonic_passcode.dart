import 'dart:convert';

import 'package:app/common/index.dart';

Future<MnemonicWithKey> saveMnemonicWithPasscode({
  required String mnemonicPhrase,
  required String passCodeStr,
}) async {
  Map<String, dynamic> keyPair =
      await getKeyPairFromMnemonicSentence(mnemonicPhrase);
  String passcode = passCodeStr;
  MnemonicWithKey mnemonicWithKey = MnemonicWithKey(
    mnemonic: mnemonicPhrase,
    publicKey: keyPair[MnemonicWithKey.publicKeyId],
    privateKey: keyPair[MnemonicWithKey.privateKeyId],
  );
  String data = jsonEncode(mnemonicWithKey.toJson());
  await saveDataWithPwd(data, passcode);
  Console.log("[saveMnemonicWithPasscode]save data success");
  return mnemonicWithKey;
}
