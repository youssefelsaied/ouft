import 'package:flutter/material.dart';

import '../screens/auth screens/chooseCountry.dart';
import '../screens/auth screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../wrappers/wrapper_home.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class WrapperAuth extends StatefulWidget {
  static const routeName = '/wrapper_auth';

  @override
  _WrapperAuthState createState() => _WrapperAuthState();
}

class _WrapperAuthState extends State<WrapperAuth> {
  late Future<bool> isAuth;
  @override
  void initState() {
    super.initState();
    isAuth = _getAuth();
  }

  Future<bool> _getAuth() async {
    print("WrapperAuth");

    final auth = Provider.of<Auth>(context, listen: false);
    // auth.getCountries();
    print("iam here get auth");
    // print(auth.userCountry);
    // print(auth.lastLocation);

    return await auth.tryAutoLogin();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/images/logo.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isAuth,
        builder: (ctx, authSnapshot) {
          switch (authSnapshot.connectionState) {
            case ConnectionState.waiting:
              return const SplashScreen();
            case ConnectionState.done:
              return Provider.of<Auth>(context, listen: true).isAuth
                  ? WrapperHome()
                  : const chooseCountry();
            default:
              return const chooseCountry();
          }
        }
        // authsnapshot.connectionState==ConnectionState.waiting ? SplashScreen() : authsnapshot.data ? WrapperChooseCity():AuthScreen(),
        );
  }
}
