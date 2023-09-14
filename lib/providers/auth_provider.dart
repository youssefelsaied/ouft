import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/reset_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/url.dart';
import '../models/user.dart';

class Auth with ChangeNotifier {
  String currency = 'SAR';
  String saveLoadingTxt = '';
  bool offerShowed = false;
  final String androidAppVersion = '1.0.0';
  final String iosAppVersion = '1.0.0';
  bool needsUpdate = false;
  bool softUpdate = true;
  Url u = Url();
  UserData? theUser;
  List<CountryData> countries = [
    CountryData(
        id: 1,
        title: "قطر",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOM5aMA77p8Pai5lv0VaUlZfyUC7d0OKCxEyWYMtmL&s",
        code: "+974",
        count: 8),
    CountryData(
        id: 2,
        title: "مصر",
        img:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZmlfREjRC6fFToYIeD3lJSER09JrBC1gGmzkhpzi6aA&s",
        code: "+2",
        count: 0),
  ];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool get isAuth {
    // print((theUser.token == null).toString());
    return theUser != null;
  }

  Future<bool> tryAutoLogin() async {
    final SharedPreferences prefs = await _prefs;
    print("tryAutoLogin");

    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = prefs.getString("userData");
    print("extractedUserData");
    print(extractedUserData);

    if (extractedUserData != null || extractedUserData!.isNotEmpty) {
      theUser = userFromJson(extractedUserData).data;
      notifyListeners();
      // fetchProfile();
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> showProfile() async {
  //   try {
  //     final response = await u.getRequest("user/show", theUser!.token);
  //     final responseData = json.decode(response.body);
  //     print(responseData);
  //     User tempUser = User.fromJson(responseData);
  //     if (tempUser.error) {
  //       throw HttpException(tempUser.message);
  //     } else {
  //       theUser = tempUser.data;
  //       notifyListeners();
  //       String tempJsonUser = userToJson(tempUser);
  //       print(tempJsonUser);
  //       final prefs = await _prefs;
  //       prefs.setString("userData", tempJsonUser);
  //       return true;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<bool> signIn(
      String emailOrPhone, String password, bool remember) async {
    const deviceToken = "await _firebaseMessaging.getToken()";
    try {
      final response = await u.postRequest({
        "email": emailOrPhone,
        "device_token": deviceToken.toString(),
        "password": password,
      }, 'user/login');
      final responseData = json.decode(response.body);
      print(responseData);
      User tempUser = User.fromJson(responseData);
      if (tempUser.error) {
        throw HttpException(tempUser.message);
      } else {
        theUser = tempUser.data;
        notifyListeners();
        if (remember) {
          String tempJsonUser = userToJson(tempUser);
          print(tempJsonUser);
          final prefs = await _prefs;
          prefs.setString("userData", tempJsonUser);
        }
        return true;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Future<bool> getCountries() async {
  //   try {
  //     final response = await u.getRequest('countries');
  //     final responseData = json.decode(response.body);
  //     // if (kDebugMode) {
  //     //   print(responseData);
  //     // }
  //     // Country tempCountries = Country.fromJson(responseData);
  //     // if (tempCountries.error) {
  //     //   throw HttpException(tempCountries.message);
  //     // } else {
  //     //   countries = tempCountries.data;
  //     //   notifyListeners();
  //     //   return true;
  //     // }
  //     return true;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<bool> register(String name, String email, String password) async {
    const deviceToken = "await _firebaseMessaging.getToken()";
    try {
      final response = await u.postRequest({
        "name": name,
        "email": email,
        "password": password,
        "device_token": deviceToken.toString(),
      }, 'user/register');
      final responseData = json.decode(response.body);
      print(responseData);
      User tempUser = User.fromJson(responseData);
      if (tempUser.error) {
        throw HttpException(tempUser.message);
      } else {
        theUser = tempUser.data;
        notifyListeners();
        String tempJsonUser = userToJson(tempUser);
        print(tempJsonUser);
        final prefs = await _prefs;
        prefs.setString("userData", tempJsonUser);
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    theUser = null;
    u.postRequest({}, 'user/logOut');
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  Future<String> changePassword(oldPassword, newPassword) async {
    final response = await u.postRequest(
        {"old_password": oldPassword, "new_password": newPassword},
        'user/changePassword',
        theUser!.token);
    final responseData = json.decode(response.body);
    print(responseData);
    ResetPassword data = ResetPassword.fromJson(responseData);
    if (!data.error) {
      return data.message;
    } else {
      return data.message;
    }
  }

  Future<String> deleteAccount(password) async {
    final response = await u.postRequest({
      "password": password,
    }, 'user/remove-account', theUser!.token);
    final responseData = json.decode(response.body);
    print(responseData);
    ResetPassword data = ResetPassword.fromJson(responseData);
    if (!data.error) {
      return data.message;
    } else {
      return data.message;
    }
  }
}
