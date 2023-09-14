import 'package:flutter/material.dart';
import 'package:ouft/providers/cart_provider.dart';
import 'package:ouft/wrappers/wrapper_auth.dart';
import '../providers/auth_provider.dart';
import '../providers/data_provider.dart';
import '../providers/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../screens/language_screens/choose_language_screen.dart';
import '../wrappers/wrapper_first_time.dart';
import '../wrappers/wrapper_language.dart';
import 'package:provider/provider.dart';
import './l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

// Future<void> main() async {
//   // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   // await Future.delayed(Duration(seconds: 3));
//   // FlutterNativeSplash.remove();
//   runApp(const MyApp());
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (ctx) => Auth(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => DataProvider(),
              ),
              ChangeNotifierProvider(
                create: (ctx) => CartProvider(),
              ),
              // ChangeNotifierProvider(
              //   create: (ctx) => OrderProvider(),
              // ),
            ],
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Ouft',
                  theme: ThemeData(
                      primarySwatch: Colors.pink, fontFamily: 'Poppins'),
                  locale: provider.locale,
                  // supportedLocales: L10n.all,
                  supportedLocales: [Locale('en', 'US')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  // home: WrapperHome()),
                  home: WrapperAuth()),
            ),
          );
        },
      );
}
