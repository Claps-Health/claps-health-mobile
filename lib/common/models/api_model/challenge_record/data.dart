// "data": {
//   "app": {
//     "time": 1686022651000,
//     "time_end": null,
//     "content": {"mood": "happy"}
//   },
//   "blockchain": {"txid": "0x92354d95c16c860057cf82835a09403d6f21fce1bab1b28ea2182ec4e61c9aa6"}
// }

import 'app.dart';
import 'blockchain.dart';

class Data {
  App? app;
  Blockchain? blockchain;

  Data({this.app, this.blockchain});

  @override
  String toString() => 'Data(app: $app, blockchain: $blockchain)';

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        app: json['app'] == null
            ? null
            : App.fromJson(json['app'] as Map<String, dynamic>),
        blockchain: json['blockchain'] == null
            ? null
            : Blockchain.fromJson(json['blockchain'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'app': app?.toJson(),
        'blockchain': blockchain?.toJson(),
      };
}
