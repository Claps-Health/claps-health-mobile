// "content": {
//   "mood": "happy" // random for different type
// }

class Content {
  Map<String, dynamic>? savedDetail;

  Content({this.savedDetail});

  @override
  String toString() => 'Content($savedDetail)';

  factory Content.fromJson(Map<String, dynamic> json) =>
      Content(savedDetail: json);

  Map<String, dynamic> toJson() => savedDetail ?? {};
}
