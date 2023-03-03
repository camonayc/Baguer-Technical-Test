import 'dart:convert';

class PictureData {
    PictureData({
        required this.large,
        required this.medium,
        required this.thumbnail,
    });

    String large;
    String medium;
    String thumbnail;

    factory PictureData.fromJson(String str) => PictureData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PictureData.fromMap(Map<String, dynamic> json) => PictureData(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toMap() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}