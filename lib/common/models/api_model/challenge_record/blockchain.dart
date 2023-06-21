// "blockchain": {
//   "txid": "0x92354d95c16c860057cf82835a09403d6f21fce1bab1b28ea2182ec4e61c9aa6"
// }

class Blockchain {
  String? txid;

  Blockchain({this.txid});

  @override
  String toString() => 'Blockchain(txid: $txid)';

  factory Blockchain.fromJson(Map<String, dynamic> json) => Blockchain(
        txid: json['txid'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'txid': txid,
      };
}
