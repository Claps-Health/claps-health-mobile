import 'package:app/common/index.dart';
import 'package:convert/convert.dart';
import 'package:cryptography/cryptography.dart';

Future<Map<String, String>> getKeyPairFromMnemonicSentence(
    String sentence) async {
  final keyPair = await CrossPlatformUtils.getSubstrateKeyPair(sentence);
  String pubKey = keyPair[CrossPlatformUtils.publicKey] as String;
  String priKey = keyPair[CrossPlatformUtils.privateKey] as String;
  return {
    CrossPlatformUtils.publicKey: pubKey,
    CrossPlatformUtils.privateKey: priKey
  };
}

Future<void> saveDataWithPwd(String data, String passcode) async {
  List<int> passCodeSha256 = await sha256WithPassword(passcode);
  SecretKey customSecretKey = await secretKeyWithPasscode(passCodeSha256);
  SecretBox secretBox = await encryptMessage(data, customSecretKey);
  Console.log('SecretBoxMap: ${secretBox.toMap()}');
  await saveSecretBoxInfo(secretBox, Constants.mySecretBoxKey);
}

Future<String> getMyData(String passcode) async {
  SecretBox rSecretBox =
      await getSecretBoxFromStorage(Constants.mySecretBoxKey);
  Console.log('rSecretBoxMap: ${rSecretBox.toMap()}');

  List<int> inputPassCodeSha256 = await sha256WithPassword(passcode);
  SecretKey inputCustomSecretKey =
      await secretKeyWithPasscode(inputPassCodeSha256);

  String clearText = await decryptMessage(rSecretBox, inputCustomSecretKey);
  Console.log('Cleartext: $clearText');

  return clearText;
}

Future<String> generateDID(String pubKey) async {
  // sha256 public key
  List<int> DIDbytes = (await Sha256().hash(hex.decode(pubKey))).bytes;
  String DID = hex.encode(DIDbytes);
  return DID;
}
