// To parse this JSON data, do
//
//     final bookingGet = bookingGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'section_show.dart';

BookingGet bookingGetFromJson(String str) =>
    BookingGet.fromJson(json.decode(str));

String bookingGetToJson(BookingGet data) => json.encode(data.toJson());

class BookingGet {
  bool error;
  String message;
  int statusCode;
  List<bookingGetData> data;
  int lastPage;

  BookingGet({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
    required this.lastPage,
  });

  factory BookingGet.fromJson(Map<String, dynamic> json) => BookingGet(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: List<bookingGetData>.from(
            json["data"].map((x) => bookingGetData.fromJson(x))),
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "last_page": lastPage,
      };
}

class bookingGetData {
  int id;
  String userId;
  int itemId;
  String status;
  DateTime date;
  String time;
  int price;
  Item item;
  Service service;
  Section section;

  bookingGetData({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.status,
    required this.date,
    required this.time,
    required this.price,
    required this.item,
    required this.service,
    required this.section,
  });

  factory bookingGetData.fromJson(Map<String, dynamic> json) => bookingGetData(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        price: json["price"],
        item: Item.fromJson(json["item"]),
        service: Service.fromJson(json["service"]),
        section: Section.fromJson(json["section"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "status": status,
        "date": date.toIso8601String(),
        "time": time,
        "price": price,
        "item": item.toJson(),
        "service": service.toJson(),
        "section": section.toJson(),
      };
}

class Item {
  int id;
  String title;
  String address;
  String image;
  int rating;
  bool bookmark;
  String firstNumber;
  String secondNumber;
  String lat;
  String long;
  Section category;

  Item({
    required this.id,
    required this.title,
    required this.address,
    required this.image,
    required this.rating,
    required this.bookmark,
    required this.firstNumber,
    required this.secondNumber,
    required this.lat,
    required this.long,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        image: json["image"],
        rating: json["rating"],
        bookmark: json["bookmark"],
        firstNumber: json["first_number"],
        secondNumber: json["second_number"],
        lat: json["lat"],
        long: json["long"],
        category: Section.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "image": image,
        "rating": rating,
        "bookmark": bookmark,
        "first_number": firstNumber,
        "second_number": secondNumber,
        "lat": lat,
        "long": long,
        "category": category.toJson(),
      };
}

class Section {
  int id;
  String title;
  String image;

  Section({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
