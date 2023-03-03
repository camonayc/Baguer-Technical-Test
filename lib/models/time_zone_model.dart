import 'dart:convert';

class Timezone {
    Timezone({
        required this.offset,
        required this.description,
    });

    String offset;
    String description;

    factory Timezone.fromJson(String str) => Timezone.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Timezone.fromMap(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "offset": offset,
        "description": description,
    };
}