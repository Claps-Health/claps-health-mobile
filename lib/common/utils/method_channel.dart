import 'package:app/common/index.dart';
import 'package:flutter/services.dart';

class CrossPlatformUtils {
  static const String _channelName = 'com.clapsHealth.dev/genKeyPair';
  static const String publicKey = 'PublicKey';
  static const String privateKey = 'PrivateKey';
  static const MethodChannel _channel = MethodChannel(_channelName);

  static Future<Map> getSubstrateKeyPair(String mnemonic) async {
    final keyPair =
        await _channel.invokeMethod('getKeyPair', {'mnemonic': mnemonic});
    Console.log('[GenKeyPair] $keyPair');
    return keyPair;
  }

  static Future<String> getSignatureWithMsg(
      String message, String privateKey) async {
    String signature = await _channel.invokeMethod(
        'signMessage', {'message': message, 'privateKey': privateKey});
    Console.log('[GetSignature] $signature');
    return signature;
  }
}
