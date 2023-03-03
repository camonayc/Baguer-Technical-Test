import 'dart:convert';

import 'package:technical_test_baguer/models/models.dart';

class Data {
  Data({
    required this.results,
    required this.info,
  });

  List<User> results;
  InfoData info;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        results: List<User>.from(json["results"].map((x) => User.fromMap(x))),
        info: InfoData.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "info": info.toMap(),
      };
}


