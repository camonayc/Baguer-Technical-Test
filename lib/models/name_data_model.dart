import 'dart:convert';

class NameData {
  NameData({
    required this.title,
    required this.first,
    required this.last,
  });

  String title;
  String first;
  String last;

  factory NameData.fromJson(String str) => NameData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NameData.fromMap(Map<String, dynamic> json) => NameData(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "first": first,
        "last": last,
      };
}
