import 'dart:convert';

import 'package:technical_test_baguer/models/models.dart';

class User {
  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  String gender;
  NameData name;
  Location location;
  String email;
  LoginData login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  PictureData picture;
  String nat;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        gender: json["gender"],
        name: NameData.fromMap(json["name"]),
        location: Location.fromMap(json["location"]),
        email: json["email"],
        login: LoginData.fromMap(json["login"]),
        dob: Dob.fromMap(json["dob"]),
        registered: Dob.fromMap(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: Id.fromMap(json["id"]),
        picture: PictureData.fromMap(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "name": name.toMap(),
        "location": location.toMap(),
        "email": email,
        "login": login.toMap(),
        "dob": dob.toMap(),
        "registered": registered.toMap(),
        "phone": phone,
        "cell": cell,
        "id": id.toMap(),
        "picture": picture.toMap(),
        "nat": nat,
      };
}
