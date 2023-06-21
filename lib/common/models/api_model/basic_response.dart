// {
// "error": 0,
// "msg": "string",
// "data": "string"
// }

class BasicResponseModel {
  int? error;
  String? msg;
  dynamic data;

  BasicResponseModel({this.error, this.msg, this.data});

  factory BasicResponseModel.fromJson(Map<String, dynamic> json) =>
      BasicResponseModel(
        error: json['error'] as int?,
        msg: json['msg'] as String?,
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data,
      };
}
