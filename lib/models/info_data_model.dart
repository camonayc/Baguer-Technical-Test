import 'dart:convert';

class InfoData {
  InfoData({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  String seed;
  int results;
  int page;
  String version;

  factory InfoData.fromJson(String str) => InfoData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoData.fromMap(Map<String, dynamic> json) => InfoData(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}