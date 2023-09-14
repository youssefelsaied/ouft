import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import '../providers/data_provider.dart';
import '../screens/main screens/main_screen.dart';
import '../screens/splash_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';

class WrapperHome extends StatefulWidget {
  static const routeName = '/wrapper_home';

  @override
  _WrapperHomeState createState() => _WrapperHomeState();
}

class _WrapperHomeState extends State<WrapperHome> {
  late Future<void> hasData;

  @override
  void initState() {
    super.initState();
    hasData = _getData();
  }

  Future _getData() async {
    final auth = Provider.of<Auth>(context, listen: false);
    final data = Provider.of<DataProvider>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    final local = Provider.of<LocaleProvider>(context, listen: false).locale;
    var token = auth.theUser == null ? "" : auth.theUser!.token;
    data.getHome(token);

    // final getProfile = auth.showProfile();
    final getWelcomes = data.getWelcomes(token);
    final getCategories = data.getCategories(token);
    final getItemsByCategoryId = data.getAllSalons(token);
    final getHome = data.getHome(token);
    final getFavs = data.getFavs(token);
    final getAddresses = data.getAddresses(token);
    final getCities = data.getCities(token);
    final getCart = cart.getCartItems(token);
    final getAcceptedOrders = cart.getAcceptedOrders(token);
    final getPendingOrders = cart.getPendingOrders(token);
    final getCancelledOrders = cart.getCancelledOrders(token);
    final getAppoinmentsFirstTimeInprogress =
        cart.getAppoinmentsFirstTimeInprogress(token);
    final getAppoinmentsFirstTimeCompleted =
        cart.getAppoinmentsFirstTimeCompleted(token);
    final getAppoinmentsFirstTimeCanceled =
        cart.getAppoinmentsFirstTimeCanceled(token);

    try {
      List responses = await Future.wait([
        getHome,
        getWelcomes,
        getCategories,
        getCart,
        getAcceptedOrders,
        getPendingOrders,
        getCancelledOrders,
        getAppoinmentsFirstTimeInprogress,
        getAppoinmentsFirstTimeCompleted,
        getAppoinmentsFirstTimeCanceled,
        getItemsByCategoryId,
        getAddresses,
        getCities,
        getFavs
        // getProfile,
        // getHospitals,
        // getClinics,
        // getDoctors,
        // getCenters
        // getAppVersion,
      ]);
      return responses;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: hasData,
        builder: (ctx, authSnapshot) {
          switch (authSnapshot.connectionState) {
            case ConnectionState.waiting:
              return SplashScreen();
            case ConnectionState.done:
              return MainScreen();
            default:
              return SplashScreen();
          }
        });
  }
}
