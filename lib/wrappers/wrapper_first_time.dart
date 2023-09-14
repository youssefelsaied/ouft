// ignore_for_file: use_build_context_synchronously

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import '../screens/welcome screens/welcome_screen.dart';
import '../wrappers/wrapper_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WrapperFirstTime extends StatefulWidget {
  const WrapperFirstTime({Key? key}) : super(key: key);

  @override
  _WrapperFirstTimeState createState() => _WrapperFirstTimeState();
}

class _WrapperFirstTimeState extends State<WrapperFirstTime>
    with AfterLayoutMixin<WrapperFirstTime> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => WrapperAuth(),
        ),
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const WelcomeScreen(),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
}
