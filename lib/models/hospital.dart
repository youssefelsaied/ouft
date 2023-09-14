// To parse this JSON data, do
//
//     final hospital = hospitalFromJson(jsonString);

import '../models/doctor.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
  bool error;
  String message;
  int statusCode;
  List<HospitalData> data;

  Hospital({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<HospitalData>.from(
            json["data"].map((x) => HospitalData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HospitalData {
  int id;
  String name;
  String image;
  String description;
  List<DoctorData> doctors;

  HospitalData({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.doctors,
  });

  factory HospitalData.fromJson(Map<String, dynamic> json) => HospitalData(
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
