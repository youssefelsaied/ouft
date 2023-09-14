// To parse this JSON data, do
//
//     final checkAvilableTime = checkAvilableTimeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckAvilableTime checkAvilableTimeFromJson(String str) =>
    CheckAvilableTime.fromJson(json.decode(str));

String checkAvilableTimeToJson(CheckAvilableTime data) =>
    json.encode(data.toJson());

class CheckAvilableTime {
  bool error;
  String message;
  int statusCode;
  List<CheckAvilableTimeData> data;

  CheckAvilableTime({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory CheckAvilableTime.fromJson(Map<String, dynamic> json) =>
      CheckAvilableTime(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<CheckAvilableTimeData>.from(
            json["data"].map((x) => CheckAvilableTimeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CheckAvilableTimeData {
  String status;
  String hour;

  CheckAvilableTimeData({
    required this.status,
    required this.hour,
  });

  factory CheckAvilableTimeData.fromJson(Map<String, dynamic> json) =>
      CheckAvilableTimeData(
        status: json["status"],
        hour: json["hour"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "hour": hour,
      };
}
