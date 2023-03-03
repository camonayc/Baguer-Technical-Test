import 'dart:convert';

class Coordinates {
    Coordinates({
        required this.latitude,
        required this.longitude,
    });

    String latitude;
    String longitude;

    factory Coordinates.fromJson(String str) => Coordinates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}