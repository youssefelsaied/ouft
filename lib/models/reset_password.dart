// To parse this JSON data, do
//
//     final resetPassword = resetPasswordFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResetPassword resetPasswordFromJson(String str) =>
    ResetPassword.fromJson(json.decode(str));

String resetPasswordToJson(ResetPassword data) => json.encode(data.toJson());

class ResetPassword {
  bool error;
  String message;
  int statusCode;
  dynamic data;

  ResetPassword({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data,
      };
}
