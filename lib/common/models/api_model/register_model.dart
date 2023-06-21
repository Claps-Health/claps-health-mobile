// {
// "network": "substrate",
// "pubkey": "0x46ebddef8cd9bb167dc30878d7113b7e168e6f0646beffd77d69d39bad76b47a",
// "did": "0xf407beb5eb86963ce7d2994f46bb162c62e4612c8b58262acc0c5409a075fc3a",
// "algorithm": "RS25519",
// "signature": "0xd872064138f7524aeb032299353377098682a368cfa98ca60b7da433ec7ebc2640ee06e771c72d32e8ec9ba816e80add75de3b83a40aa6f9ac449d652dc12f82"
// }

class RegisterModel {
  String network;
  String pubkey;
  String did;
  String algorithm;
  String signature;

  RegisterModel({
    this.network = 'substrate',
    required this.pubkey,
    required this.did,
    this.algorithm = 'RS25519',
    required this.signature,
  }) {
    check0xFormat();
  }

  void check0xFormat() {
    if (!pubkey.startsWith('0x')) {
      pubkey = '0x$pubkey';
    }
    if (!did.startsWith('0x')) {
      did = '0x$did';
    }
    if (!signature.startsWith('0x')) {
      signature = '0x$signature';
    }
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        network: json['network'] as String,
        pubkey: json['pubkey'] as String,
        did: json['did'] as String,
        algorithm: json['algorithm'] as String,
        signature: json['signature'] as String,
      );

  Map<String, dynamic> toJson() => {
        'network': network,
        'pubkey': pubkey,
        'did': did,
        'algorithm': algorithm,
        'signature': signature,
      };
}
