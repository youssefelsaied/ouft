// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import '../models/doctor.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

class Clinic {
  bool error;
  String message;
  int statusCode;
  List<ClinicData> data;

  Clinic({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<ClinicData>.from(
            json["data"].map((x) => ClinicData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ClinicData {
  int id;
  String name;
  String image;
  String description;
  String address;
  List<DoctorData> doctors;

  ClinicData({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.address,
    required this.doctors,
  });

  factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        address: json["address"],
        doctors: List<DoctorData>.from(
            json["doctors"].map((x) => DoctorData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "address": address,
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}
