// To parse this JSON data, do
//
//     final showItem = showItemFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShowItem showItemFromJson(String str) => ShowItem.fromJson(json.decode(str));

String showItemToJson(ShowItem data) => json.encode(data.toJson());

class ShowItem {
  bool error;
  String message;
  int statusCode;
  ShowItemData data;

  ShowItem({
    required this.error,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ShowItem.fromJson(Map<String, dynamic> json) => ShowItem(
        error: json["error"],
        message: json["message"],
        statusCode: json["status_code"],
        data: ShowItemData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status_code": statusCode,
        "data": data.toJson(),
      };
}

class ShowItemData {
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
  ShowItemCategory category;
  List<ShowItemCategory> sections;
  List<Day> days;
  List<ItemImage> images;

  ShowItemData({
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
    required this.sections,
    required this.days,
    required this.images,
  });

  factory ShowItemData.fromJson(Map<String, dynamic> json) => ShowItemData(
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
        category: ShowItemCategory.fromJson(json["category"]),
        sections: List<ShowItemCategory>.from(
            json["sections"].map((x) => ShowItemCategory.fromJson(x))),
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        images: List<ItemImage>.from(
            json["images"].map((x) => ItemImage.fromJson(x))),
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
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ShowItemCategory {
  int id;
  String title;
  String image;

  ShowItemCategory({
    required this.id,
    required this.title,
    required this.image,
  });

  factory ShowItemCategory.fromJson(Map<String, dynamic> json) =>
      ShowItemCategory(
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

class Day {
  int id;
  int dayId;
  String fromHour;
  String toHour;

  Day({
    required this.id,
    required this.dayId,
    required this.fromHour,
    required this.toHour,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        dayId: json["day_id"],
        fromHour: json["from_hour"],
        toHour: json["to_hour"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day_id": dayId,
        "from_hour": fromHour,
        "to_hour": toHour,
      };
}

class ItemImage {
  int id;
  int itemId;
  String image;

  ItemImage({
    required this.id,
    required this.itemId,
    required this.image,
  });

  factory ItemImage.fromJson(Map<String, dynamic> json) => ItemImage(
        id: json["id"],
        itemId: json["item_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "image": image,
      };
}
