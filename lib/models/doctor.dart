// To parse this JSON data, do
//
//     final doctor = doctorFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  bool error;
  String message;
  int statusCode;
  List<DoctorData> data;

  Doctor({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<DoctorData>.from(
            json["data"].map((x) => DoctorData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DoctorData {
  int id;
  String name;
  String phone;
  String email;
  String specialist;
  String description;
  String categories;
  String image;

  DoctorData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.specialist,
    required this.description,
    required this.categories,
    required this.image,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) => DoctorData(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        specialist: json["specialist"],
        description: json["description"],
        categories: json["categories"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "specialist": specialist,
        "description": description,
        "categories": categories,
        "image": image,
      };
}
