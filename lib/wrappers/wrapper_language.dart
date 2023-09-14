// // ignore_for_file: use_build_context_synchronously, prefer_const_constructors

// import 'package:after_layout/after_layout.dart';
// import 'package:flutter/material.dart';
// import '../screens/language_screens/choose_language_screen.dart';
// import '../wrappers/wrapper_first_time.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../providers/locale_provider.dart';

// class WrapperLanguage extends StatefulWidget {
//   const WrapperLanguage({Key? key}) : super(key: key);

//   @override
//   _WrapperLanguageState createState() => _WrapperLanguageState();
// }

// class _WrapperLanguageState extends State<WrapperLanguage>
//     with AfterLayoutMixin<WrapperLanguage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   Future checkFirstSeen() async {
//     final language = Provider.of<LocaleProvider>(context, listen: false);
//     language.getSavedLanguage();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool seen = (prefs.getBool('language_seen') ?? false);

//     if (seen) {
//       Navigator.push<void>(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => WrapperFirstTime(),
//         ),
//       );
//     } else {
//       // await prefs.setBool('language_seen', true);
//       Navigator.push<void>(
//         context,
//         MaterialPageRoute<void>(
//           builder: (BuildContext context) => const ChooseLanguageScreen(),
//         ),
//       );
//     }
//   }

//   @override
//   void afterFirstLayout(BuildContext context) => checkFirstSeen();
// }
