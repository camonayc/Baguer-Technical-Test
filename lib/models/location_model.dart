import 'dart:convert';

import 'package:get/get.dart';
import 'package:technical_test_baguer/models/models.dart';

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  Street street;
  String city;
  String state;
  String country;
  String postcode;
  Coordinates coordinates;
  Timezone timezone;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        street: Street.fromMap(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"].toString(),
        coordinates: Coordinates.fromMap(json["coordinates"]),
        timezone: Timezone.fromMap(json["timezone"]),
      );

  Map<String, dynamic> toMap() => {
        "street": street.toMap(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toMap(),
        "timezone": timezone.toMap(),
      };
}
