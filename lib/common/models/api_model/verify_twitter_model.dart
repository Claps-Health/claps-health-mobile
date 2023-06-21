class VerifyTwitterModel {
  String did;
  String algorithm;
  String link;

  VerifyTwitterModel(
      {required this.did, this.algorithm = "RS25519", required this.link});

  factory VerifyTwitterModel.fromJson(Map<String, dynamic> json) {
    return VerifyTwitterModel(
      did: json['did'] as String,
      algorithm: json['algorithm'] as String,
      link: json['link'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    String myUserDID = did;
    if (!myUserDID.startsWith('0x')) {
      myUserDID = '0x$myUserDID';
    }

    return {
      'did': myUserDID,
      'algorithm': algorithm,
      'link': link,
    };
  }
}
