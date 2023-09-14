// To parse this JSON data, do
//
//     final center = centerFromJson(jsonString);

import '../models/doctor.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Center centerFromJson(String str) => Center.fromJson(json.decode(str));

String centerToJson(Center data) => json.encode(data.toJson());

class Center {
  bool error;
  String message;
  int statusCode;
  List<CenterData> data;

  Center({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CenterData>.from(
            json["data"].map((x) => CenterData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CenterData {
  int id;
  String name;
  String image;
  String description;
  List<DoctorData> doctors;

  CenterData({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.doctors,
  });

  factory CenterData.fromJson(Map<String, dynamic> json) => CenterData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        doctors: List<DoctorData>.from(
            json["doctors"].map((x) => DoctorData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}
