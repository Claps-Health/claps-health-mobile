class MnemonicWithKey {
  static const String mnemonicKeyId = 'Mnemonic';
  static const String publicKeyId = 'PublicKey';
  static const String privateKeyId = 'PrivateKey';

  final String mnemonic;
  final String publicKey;
  final String privateKey;

  const MnemonicWithKey(
      {required this.mnemonic,
      required this.publicKey,
      required this.privateKey});

  factory MnemonicWithKey.fromJson(Map<String, dynamic> json) {
    return MnemonicWithKey(
      mnemonic: json[mnemonicKeyId] as String,
      publicKey: json[publicKeyId] as String,
      privateKey: json[privateKeyId] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      mnemonicKeyId: mnemonic,
      publicKeyId: publicKey,
      privateKeyId: privateKey,
    };
  }
}
