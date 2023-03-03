import 'dart:convert';

class Street {
    Street({
        required this.number,
        required this.name,
    });

    int number;
    String name;

    factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Street.fromMap(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "number": number,
        "name": name,
    };
}