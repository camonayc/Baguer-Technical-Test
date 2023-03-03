import 'dart:convert';

class Dob {
  Dob({
    required this.date,
    required this.age,
  });

  DateTime date;
  int age;

  factory Dob.fromJson(String str) => Dob.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dob.fromMap(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toMap() => {
        "date": date.toIso8601String(),
        "age": age,
      };
}
