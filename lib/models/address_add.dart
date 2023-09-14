// To parse this JSON data, do
//
//     final addressAdd = addressAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddressAdd addressAddFromJson(String str) =>
    AddressAdd.fromJson(json.decode(str));

String addressAddToJson(AddressAdd data) => json.encode(data.toJson());

class AddressAdd {
  bool error;
  String message;
  int statusCode;
  Data data;

  AddressAdd({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory AddressAdd.fromJson(Map<String, dynamic> json) => AddressAdd(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String fullName;
  String mobile;
  String description;

  Data({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        mobile: json["mobile"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "mobile": mobile,
        "description": description,
      };
}
