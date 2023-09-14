import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ouft/models/order_add.dart';

import '../helpers/url.dart';
import '../models/booking_add.dart';
import '../models/booking_get.dart';
import '../models/cart.dart';
import '../models/cart_add.dart';
import '../models/cart_delete.dart';
import '../models/order_get.dart';

class CartProvider with ChangeNotifier {
  List<CartItemData> cart = [];
  List<OrderGetData> pendingOrders = [];
  List<OrderGetData> acceptedOrders = [];
  List<OrderGetData> cancelledOrders = [];
  double subTotal = 0;
  double discount = 0;
  double shippingCost = 0;
  double totalPrice = 0;
  Url u = Url();

  double calculateSubTotal() {
    subTotal = 0;
    for (var element in cart) {
      subTotal = subTotal +
          ((double.parse(element.product.finalPrice.toString())) *
              (double.parse(element.quantity.toString())));
    }
    return subTotal;
  }

  double calculateTotal() {
    totalPrice = calculateSubTotal() + shippingCost - discount;
    return totalPrice;
  }

  Future<bool> getCartItems(token) async {
    try {
      final response = await u.getRequest('cart/get', token);
      final responseData = json.decode(response.body);
      if (kDebugMode) {
        // print(responseData);
      }
      print(responseData);
      Cart tempCart = Cart.fromJson(responseData);
      if (tempCart.error) {
        throw HttpException(tempCart.message);
      } else {
        cart = tempCart.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getPendingOrders(token) async {
    try {
      final response =
          await u.postRequest({"status": "pending"}, 'order/get', token);
      final responseData = json.decode(response.body);
      if (kDebugMode) {
        // print(responseData);
      }
      print(responseData);
      OrderGet tempGetOrder = OrderGet.fromJson(responseData);
      if (tempGetOrder.error) {
        throw HttpException(tempGetOrder.message);
      } else {
        pendingOrders = tempGetOrder.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getAcceptedOrders(token) async {
    try {
      final response =
          await u.postRequest({"status": "accepted"}, 'order/get', token);
      final responseData = json.decode(response.body);
      if (kDebugMode) {
        // print(responseData);
      }
      print(responseData);
      OrderGet tempGetOrder = OrderGet.fromJson(responseData);
      if (tempGetOrder.error) {
        throw HttpException(tempGetOrder.message);
      } else {
        acceptedOrders = tempGetOrder.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getCancelledOrders(token) async {
    try {
      final response =
          await u.postRequest({"status": "cancelled"}, 'order/get', token);
      final responseData = json.decode(response.body);
      if (kDebugMode) {
        // print(responseData);
      }
      print(responseData);
      OrderGet tempGetOrder = OrderGet.fromJson(responseData);
      if (tempGetOrder.error) {
        throw HttpException(tempGetOrder.message);
      } else {
        cancelledOrders = tempGetOrder.data;
        notifyListeners();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addCartItem(String itemId, String quantity, token) async {
    final response = await u.postRequest({
      "product_id": itemId,
      "quantity": quantity,
    }, 'cart/add', token);
    getCartItems(token);
    final responseData = json.decode(response.body);
    print(responseData);

    CartAdd tempCart = CartAdd.fromJson(responseData);
    if (tempCart.error) {
      return false;
    } else {
      getCartItems(token);
      return true;
    }
  }

  Future<bool> clearCartItems(token) async {
    final response = await u.postRequest({}, 'cart/delete', token);
    getCartItems(token);
    final responseData = json.decode(response.body);
    CartDelete tempCart = CartDelete.fromJson(responseData);
    if (tempCart.error) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> updateCartItem(String itemId, String quantity, token) async {
    print(quantity);
    final response = await u.postRequest({
      "product_id": itemId,
      "quantity": quantity,
    }, 'cart/update_quantity', token);
    final responseData = json.decode(response.body);
    print(responseData);
    CartAdd tempCart = CartAdd.fromJson(responseData);
    if (tempCart.error) {
      return false;
    } else {
      await getCartItems(token);
      return true;
    }
  }

  Future<bool> removeCartItem(CartItemData item, token) async {
    final response = await u.postRequest({
      "product_id": item.productId.toString(),
      "quantity": 0.toString(),
    }, 'cart/update_quantity', token);
    final responseData = json.decode(response.body);
    print(responseData);
    CartDelete tempCart = CartDelete.fromJson(responseData);
    if (tempCart.error) {
      return false;
    } else {
      await getCartItems(token);
      return true;
    }
  }

  Future<bool> addQuantity(CartItemData item, token) async {
    CartItemData cartItem = cart.firstWhere((element) => element.id == item.id);
    cartItem.quantity =
        (double.parse(cartItem.quantity.toString()).toInt() + 1).toInt();
    notifyListeners();

    final res = await updateCartItem(
            item.productId.toString(), cartItem.quantity.toString(), token)
        .catchError((e) {
      cartItem.quantity =
          (double.parse(cartItem.quantity.toString()).toInt() - 1).toInt();
      notifyListeners();
      return false;
    });
    return res;
  }

  Future<bool> minQuantity(CartItemData item, token) async {
    CartItemData cartItem = cart.firstWhere((element) => element.id == item.id);
    if (double.parse(cartItem.quantity.toString()).toInt() > 1) {
      cartItem.quantity =
          (double.parse(cartItem.quantity.toString()).toInt() - 1).toInt();

      notifyListeners();
      final res = await updateCartItem(
              item.productId.toString(), cartItem.quantity.toString(), token)
          .catchError((e) {
        cartItem.quantity =
            (double.parse(cartItem.quantity.toString()).toInt() + 1).toInt();
        notifyListeners();
        return false;
      });
      if (!res) {
        cartItem.quantity =
            (double.parse(cartItem.quantity.toString()).toInt() + 1).toInt();
        notifyListeners();
        return false;
      } else {
        return true;
      }
    } else {
      return removeCartItem(cartItem, cartItem.userId);
    }
  }

  Future<OrderAdd> makeOrder(
    token,
    addressId,
  ) async {
    List<Map<String, String>> productDetails = [];
    for (var e in cart) {
      productDetails.add({
        "product_id": e.productId.toString(),
        "quantity": e.quantity.toString(),
        "size": "D",
        "price": e.product.finalPrice.toString()
      });
    }
    print(productDetails);
    Dio dio = new Dio();
    final url = "https://${u.usedUrl}/api/order/add";
    var body = {
      "transaction_type": "cash",
      "address_id": addressId,
      "products": productDetails
    };
    print(body);

    var response = await dio.post(
      url,
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }),
      data: jsonEncode(body),
    );
    print(response);
    final responseData = response.data;
    print(responseData);

    OrderAdd tempOrder = OrderAdd.fromJson(responseData);
    if (!tempOrder.error) {
      clearCartItems(token);
      getAcceptedOrders(token);
      getPendingOrders(token);
      getCancelledOrders(token);
    }
    return tempOrder;

    // if (tempOrder.error) {
    //   return tempOrder;
    // } else {
    //   return tempOrder;
    // }
  }

  BookingData? recentAppoinment;

  Future<bool> addAppoinment(
      itemId, serviceId, date, time, price, day, token) async {
    Map<String, String> productDetails = {};
    for (var e in cart) {
      productDetails.addAll({e.productId.toString(): e.quantity.toString()});
    }
    print(productDetails);
    final response = await u.postRequest({
      "item_id": itemId,
      "item_service_id": serviceId,
      "date": date,
      "time": time,
      "price": price,
      "day": day
    }, 'booking/add', token);
    final responseData = json.decode(response.body);
    print(responseData);

    BookingAdd tempAppoimnet = BookingAdd.fromJson(responseData);

    if (tempAppoimnet.error) {
      return false;
    } else {
      recentAppoinment = tempAppoimnet.data;
      notifyListeners();
      getAppoinmentsFirstTimeInprogress(token);
      getAppoinmentsFirstTimeCompleted(token);
      getAppoinmentsFirstTimeCanceled(token);
      return true;
    }
  }

  int appoinmentInprogressPage = 0;
  int appoinmentCompletedPage = 0;
  int appoinmentCanceledPage = 0;
  int lastInprogressAppoinmnetPage = 10000000;
  int lastCompletedAppoinmnetPage = 10000000;
  int lastCanceledAppoinmnetPage = 10000000;
  bool loadingAppoinmentsInprogress = false;
  bool loadingAppoinmentsCompleted = false;
  bool loadingAppoinmentsCanceled = false;
  List<bookingGetData> appoinmentsInprogress = [];
  List<bookingGetData> appoinmentsCompleted = [];
  List<bookingGetData> appoinmentsCanceled = [];

  Future<bool> getAppoinmentsFirstTimeInprogress(token) async {
    appoinmentInprogressPage = 1;
    lastInprogressAppoinmnetPage = 10000000;
    if (appoinmentInprogressPage <= lastInprogressAppoinmnetPage) {
      try {
        final url = 'https://${u.usedUrl}/api/booking/get?status=InProgress';
        print(url);
        Dio dio = Dio();
        var response = await dio.get(
          url,
          options: Options(
            headers: {
              'Content-type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),

          // queryParameters: {"user_id": userId, "page": 1}
        );
        final responseData = response.data;
        print(responseData);

        BookingGet tempApp = BookingGet.fromJson(responseData);

        if (!tempApp.error) {
          appoinmentsInprogress = tempApp.data;
          // lastAppoinmnetPage = tempApp.data.lastPage;
          appoinmentInprogressPage++;
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return false;
    }
  }

  Future<bool> getAppoinmentsFirstTimeCompleted(token) async {
    appoinmentCompletedPage = 1;
    lastCompletedAppoinmnetPage = 10000000;
    if (appoinmentCompletedPage <= lastCompletedAppoinmnetPage) {
      try {
        final url = 'https://${u.usedUrl}/api/booking/get?status=Completed';
        print(url);
        Dio dio = Dio();
        var response = await dio.get(
          url,
          options: Options(
            headers: {
              'Content-type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),

          // queryParameters: {"user_id": userId, "page": 1}
        );
        final responseData = response.data;
        print(responseData);

        BookingGet tempApp = BookingGet.fromJson(responseData);

        if (!tempApp.error) {
          appoinmentsCompleted = tempApp.data;
          // lastAppoinmnetPage = tempApp.data.lastPage;
          appoinmentCompletedPage++;
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return false;
    }
  }

  Future<bool> getAppoinmentsFirstTimeCanceled(token) async {
    appoinmentCanceledPage = 1;
    lastCanceledAppoinmnetPage = 10000000;
    if (appoinmentCanceledPage <= lastCanceledAppoinmnetPage) {
      try {
        final url = 'https://${u.usedUrl}/api/booking/get?status=Canceled';
        print(url);
        Dio dio = Dio();
        var response = await dio.get(
          url,
          options: Options(
            headers: {
              'Content-type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ),

          // queryParameters: {"user_id": userId, "page": 1}
        );
        final responseData = response.data;
        print(responseData);

        BookingGet tempApp = BookingGet.fromJson(responseData);

        if (!tempApp.error) {
          appoinmentsCanceled = tempApp.data;
          // lastAppoinmnetPage = tempApp.data.lastPage;
          appoinmentCanceledPage++;
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return false;
    }
  }

  // // Future<bool> getAppoinments(userId) async {
  // //   if (appoinmnetPage <= lastAppoinmnetPage) {
  // //     try {
  // //       // var url = Uri.https(u.usedUrl, "/api/appointments",
  // //       //     {'page': appoinmnetPage.toString()});

  // //       final url =
  // //           'https://${u.usedUrl}/api/appointments?page=$appoinmnetPage';
  // //       print(url);
  // //       Dio dio = Dio();
  // //       var response = await dio.get(
  // //         url,
  // //         options: Options(
  // //           headers: {
  // //             'Content-type': 'multipart/form-data',
  // //             'Accept': 'application/json',
  // //             // 'Accept-language': code,
  // //             // 'Authorization': 'Bearer $token',
  // //           },
  // //         ),
  // //         // queryParameters: {"page": appoinmnetPage}
  // //       );
  // //       final responseData = response.data;
  // //       print(responseData);
  // //       GetAppoinment tempDoctor = GetAppoinment.fromJson(responseData);

  // //       if (!tempDoctor.error) {
  // //         appoinments.addAll(tempDoctor.data.data);
  // //         lastAppoinmnetPage = tempDoctor.data.lastPage;
  // //         appoinmnetPage++;
  // //         notifyListeners();
  // //         return true;
  // //       } else {
  // //         return false;
  // //       }
  // //     } catch (e) {
  // //       throw e;
  // //     }
  // //   } else {
  // //     return false;
  // //   }
  // // }

}
