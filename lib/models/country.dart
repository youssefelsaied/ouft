import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  bool error;
  String message;
  int statusCode;
  List<CountryData> data;

  Country({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CountryData>.from(
            json["data"].map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryData {
  int id;
  String title;
  String img;
  String code;
  int? count;

  CountryData({
    required this.id,
    required this.title,
    required this.img,
    required this.code,
    required this.count,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["id"],
        title: json["title"],
        img: json["img"],
        code: json["code"],
        count: json["count"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": img,
        "code": code,
        "count": count,
      };
}
