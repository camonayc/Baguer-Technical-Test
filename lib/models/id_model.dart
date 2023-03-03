import 'dart:convert';

class Id {
  Id({
    required this.name,
    required this.value,
  });

  String name;
  String? value;

  factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
      };
}
