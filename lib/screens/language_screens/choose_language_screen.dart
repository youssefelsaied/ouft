import 'package:flutter/material.dart';
import '../../helpers/dimintions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/locale_provider.dart';
import '../../wrappers/wrapper_first_time.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  Future setSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('language_seen', true);
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final language = Provider.of<LocaleProvider>(context, listen: false);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = (15 / heightRatio) * height;
    final bigSpace = (115 / heightRatio) * height;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;
    final imgHeight = (189 / heightRatio) * height;
    final imgWidth = (150 / widthRatio) * width;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
              width: imgWidth,
              height: imgHeight,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.scaleDown,
              ),
            )),
            SizedBox(
              height: bigSpace,
            ),
            Texttitle(title: local.choose_language),
            SizedBox(
              height: space,
            ),
            SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: CustomButton(
                    txt: "العربية",
                    onTap: () async {
                      language.setLocale(const Locale('ar'));
                      await setSeen();
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => WrapperFirstTime(),
                        ),
                      );
                    })),
            SizedBox(
              height: space,
            ),
            SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: CustomButton(
                    txt: "English",
                    onTap: () async {
                      language.setLocale(const Locale('en'));
                      await setSeen();
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => WrapperFirstTime(),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
