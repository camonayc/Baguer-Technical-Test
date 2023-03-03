import 'dart:convert';

class LoginData {
    LoginData({
        required this.uuid,
        required this.username,
        required this.password,
        required this.salt,
        required this.md5,
        required this.sha1,
        required this.sha256,
    });

    String uuid;
    String username;
    String password;
    String salt;
    String md5;
    String sha1;
    String sha256;

    factory LoginData.fromJson(String str) => LoginData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
    );

    Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
    };
}