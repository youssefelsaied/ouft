import 'dart:convert';
import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Url {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String usedUrl = 'for-ladys.com';
  String code = 'en';

  set setUsedCode(value) {
    code = value;
  }

  Future postRequest(data, String route, [String? token = '']) async {
    var url = Uri.https(usedUrl, "/api/$route", {'q': '{https}'});
    print(url.toString());
    print(data.toString());
    try {
      final response = await http.post(url,
          headers: token == ''
              ? {
                  'Content-type': 'application/json',
                  'Accept': 'application/json',
                }
              : {
                  'Content-type': 'application/json',
                  'Accept': 'application/json',
                  'Accept-Language': code,
                  'Authorization': 'Bearer $token',
                },
          body: json.encode(data));
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future getRequest(String route, [String? token = '']) async {
    var url = Uri.https(usedUrl, "/api/$route", {'q': '{https}'});

    try {
      final response = await http.get(
        url,
        headers: token == ''
            ? {
                'Content-type': 'application/json',
                'Accept': 'application/json',
                'Accept-Language': code,
              }
            : {
                'Content-type': 'application/json',
                'Accept': 'application/json',
                'Accept-Language': code,
                'Authorization': 'Bearer $token',
              },
      );
      // print(response);
      final responseData = json.decode(response.body);
      // print(responseData);
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
