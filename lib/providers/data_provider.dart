import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ouft/models/address_add.dart';
import 'package:ouft/models/address_get.dart';
import 'package:ouft/models/area_get.dart';
import 'package:ouft/models/booking_get.dart';
import 'package:ouft/models/bookmark_add.dart';
import 'package:ouft/models/category.dart';
import 'package:ouft/models/check_avilable_time.dart';
import 'package:ouft/models/city_get.dart';
import 'package:ouft/models/home.dart';
import 'package:ouft/models/items_by_category.dart';
import 'package:ouft/models/market.dart';
import 'package:ouft/models/section_show.dart';
import 'package:ouft/models/service_show.dart';
import 'package:ouft/models/show_item.dart';
import 'package:ouft/models/welcome.dart';
import '../models/bookmark_get.dart';
import '../models/center.dart';
import '../models/clinic.dart';
import '../models/country.dart';
import '../models/doctor.dart';
import '../models/hospital.dart';

import '../helpers/url.dart';

class DataProvider with ChangeNotifier {
  Url u = Url();
  List<WelcomeData> welcomes = [];
  List<CategoryData> categories = [];
  List<HomeSlider> slider = [];
  About? about;
  ShowItemData? itemData;
  SectionShowData? sectionData;
  ServiceShowData? serviceData;
  List<OurProduct> ourProducts = [];
  List<BookmarkData> favourities = [];
  List<CategoryData> homeCategories = [];
  List<OurProduct> suggestions = [];
  List<ItemByCategoryData> itemsByCategory = [];
  List<ItemByCategoryData> defaultItemsByCategory = [];
  List<ItemByCategoryData> searchItemsByCategory = [];
  List<CheckAvilableTimeData> avilabbleTimes = [];
  List<AddressGetData> userAddresses = [];
  List<CityData> cities = [];
  List<AreaData> areaies = [];

  Future<bool> getAvilableTime(itemServiceId, date, token) async {
    avilabbleTimes = [];
    try {
      final response = await u.postRequest({
        "item_id": itemData!.id,
        "item_service_id": itemServiceId,
        "date": DateFormat("yyyy-mm-dd").format(date)
      }, 'booking_time/get', token);
      final responseData = json.decode(response.body);
      print(responseData);

      CheckAvilableTime tempObject = CheckAvilableTime.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        avilabbleTimes = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getWelcomes(token) async {
    try {
      final response = await u.getRequest('welcome_interface', token);
      final responseData = json.decode(response.body);

      Welcome tempObject = Welcome.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        welcomes = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getFavs(token) async {
    try {
      final response = await u.postRequest({}, 'bookmarks/get', token);
      final responseData = json.decode(response.body);
      print(responseData);

      BookmarkGet tempObject = BookmarkGet.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        favourities = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getCategories(token) async {
    try {
      final response = await u.getRequest('categories/get', token);
      final responseData = json.decode(response.body);

      Category tempObject = Category.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        categories = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> switchBookmark(itemId, token) async {
    try {
      searchItemsByCategory = [];
      final response = await u.postRequest(
          {"bookmarkable_id": itemId, "type": "Product"},
          'bookmark/add',
          token);
      final responseData = json.decode(response.body);
      print(responseData);

      BookmarkAdd tempObject = BookmarkAdd.fromJson(responseData);
      if (tempObject.error) {
        return false;
      } else {
        getFavs(token);
        getHome(token);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> searchSalons(search, token) async {
    try {
      searchItemsByCategory = [];
      final response =
          await u.postRequest({"search": search}, 'items/search', token);
      final responseData = json.decode(response.body);

      ItemsByCategory tempObject = ItemsByCategory.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        searchItemsByCategory = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getAllSalons(token) async {
    try {
      final response =
          await u.postRequest({"search": "all"}, 'items/search', token);
      final responseData = json.decode(response.body);

      ItemsByCategory tempObject = ItemsByCategory.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        defaultItemsByCategory = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteAdress(addressId, token) async {
    try {
      Dio dio = new Dio();
      final url = "https://${u.usedUrl}/api/address/delete/$addressId";
      var response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      final responseData = response.data;
      print(responseData);

      if (response.statusCode != 200) {
        throw HttpException(response.statusMessage!);
      } else {
        getAddresses(token);
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addAdress(fullName, description, mobile, token) async {
    try {
      Dio dio = new Dio();
      final url = "https://${u.usedUrl}/api/address/add";
      var body = {
        "full_name": fullName.toString(),
        "mobile": mobile.toString(),
        "description": description.toString(),
        "city_id": selectedCity!.id,
        "area_id": selectedArea!.id
      };
      var response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: jsonEncode(body),
      );

      final responseData = response.data;
      // final response = await u.postRequest({
      //   "full_name": fullName.toString(),
      //   "mobile": mobile.toString(),
      //   "description": description.toString(),
      //   "city_id": selectedCity!.id,
      //   "area_id": selectedArea!.id
      // }, 'address/add', token);
      // final responseData = json.decode(response.body);
      print(responseData);

      AddressAdd tempObject = AddressAdd.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        getAddresses(token);
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> editAdress(
      addressId, fullName, description, mobile, cityId, areaId, token) async {
    try {
      Dio dio = new Dio();
      final url = "https://${u.usedUrl}/api/address/update";

      var body = {
        "id": addressId,
        "full_name": fullName.toString(),
        "mobile": mobile.toString(),
        "description": description.toString(),
        "city_id": cityId,
        "area_id": areaId
      };
      var response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: jsonEncode(body),
      );

      final responseData = response.data;
      // final response = await u.postRequest({
      //   "full_name": fullName.toString(),
      //   "mobile": mobile.toString(),
      //   "description": description.toString(),
      //   "city_id": selectedCity!.id,
      //   "area_id": selectedArea!.id
      // }, 'address/add', token);
      // final responseData = json.decode(response.body);
      print(responseData);

      AddressAdd tempObject = AddressAdd.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        getAddresses(token);
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getItemsByCategoryId(categoryId, token) async {
    try {
      itemsByCategory = [];
      final response =
          await u.postRequest({"category_id": categoryId}, 'items/get', token);
      final responseData = json.decode(response.body);

      ItemsByCategory tempObject = ItemsByCategory.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        itemsByCategory = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> showItemsById(itemId, token) async {
    try {
      itemData = null;
      final response = await u.getRequest('items/show/$itemId', token);
      final responseData = json.decode(response.body);

      ShowItem tempObject = ShowItem.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        itemData = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  AddressGetData? selectedAddress;
  CityData? selectedCity;
  AreaData? selectedArea;

  void selectAddress(AddressGetData address) {
    selectedAddress = address;
    notifyListeners();
  }

  void selectCity(CityData city, token) {
    selectedCity = city;
    selectedArea = null;
    areaies = [];
    notifyListeners();
    getAreaies(city.id, token);
  }

  void selectArea(AreaData area) {
    selectedArea = area;
    notifyListeners();
  }

  Future<bool> getAddresses(token) async {
    try {
      selectedAddress = null;
      final response = await u.getRequest('address/get', token);
      final responseData = json.decode(response.body);

      AddressGet tempObject = AddressGet.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        userAddresses = tempObject.data;
        if (userAddresses.isNotEmpty) {
          selectedAddress = userAddresses[0];
        }
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getCities(token) async {
    try {
      final response = await u.getRequest('city/get', token);
      final responseData = json.decode(response.body);

      CityGet tempObject = CityGet.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        cities = tempObject.data;
        if (cities.isNotEmpty) {
          // selectedCity = cities[0];
        }
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getAreaies(cityId, token) async {
    try {
      Dio dio = new Dio();
      final url = "https://${u.usedUrl}/api/area/get?city_id=$cityId";

      var response = await dio.get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      final responseData = response.data;
      // final response = await u.getRequest('area/get?city_id=1', token);
      // final responseData = json.decode(response.body);
      print(responseData);

      AreaGet tempObject = AreaGet.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        areaies = tempObject.data;
        if (areaies.isNotEmpty) {
          // selectedCity = cities[0];
        }
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> showSectionById(itemId, token) async {
    try {
      sectionData = null;
      final response = await u.getRequest('sections/show/$itemId', token);
      final responseData = json.decode(response.body);

      SectionShow tempObject = SectionShow.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        sectionData = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> showServiceById(itemId, token) async {
    try {
      serviceData = null;
      final response = await u.getRequest('service/show/$itemId', token);
      final responseData = json.decode(response.body);

      ServiceShow tempObject = ServiceShow.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        serviceData = tempObject.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getHome(token) async {
    try {
      final response = await u.getRequest('home', token);
      final responseData = json.decode(response.body);
      print(responseData);

      Home tempObject = Home.fromJson(responseData);
      if (tempObject.error) {
        throw HttpException(tempObject.message);
      } else {
        slider = tempObject.data.slider;
        about = tempObject.data.about;
        ourProducts = tempObject.data.ourProducts;
        homeCategories = tempObject.data.categories;
        suggestions = tempObject.data.suggestions;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }
}
