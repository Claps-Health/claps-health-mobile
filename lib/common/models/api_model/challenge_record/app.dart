// "app": {
//   "time": 1686022651000,
//   "time_end": null,
//   "content": {"mood": "happy"}
// },

import 'content.dart';

class App {
  int? time;
  int? timeEnd;
  Content? content;

  App({this.time, this.timeEnd, this.content});

  @override
  String toString() {
    return 'App(time: $time, timeEnd: $timeEnd, content: $content)';
  }

  factory App.fromJson(Map<String, dynamic> json) => App(
        time: json['time'] as int?,
        timeEnd: json['time_end'] as int?,
        content: json['content'] == null
            ? null
            : Content.fromJson(json['content'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'time_end': timeEnd,
        'content': content?.toJson(),
      };
}
