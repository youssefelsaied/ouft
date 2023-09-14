// To parse this JSON data, do
//
//     final bookmarkAdd = bookmarkAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BookmarkAdd bookmarkAddFromJson(String str) =>
    BookmarkAdd.fromJson(json.decode(str));

String bookmarkAddToJson(BookmarkAdd data) => json.encode(data.toJson());

class BookmarkAdd {
  bool error;
  String message;
  int statusCode;
  String data;

  BookmarkAdd({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory BookmarkAdd.fromJson(Map<String, dynamic> json) => BookmarkAdd(
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
