import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/text_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isArabic = true;

  @override
  void initState() {
    final language = Provider.of<LocaleProvider>(context, listen: false);

    if (language.locale.languageCode == "ar") {
      isArabic = true;
    } else {
      isArabic = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;
    final language = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCardBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Texttitle(title: local.language),
      ),
      backgroundColor: kCardBackgroundColor,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              local.suggestions,
              style: TextStyle(
                fontSize: 20,
                color: ksecondTextColor,
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'العربية ',
                  style: TextStyle(
                    fontSize: 16,
                    color: kMainTextColor,
                  ),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  value: isArabic,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (bool? value) {
                    setState(() {
                      isArabic = !isArabic;
                      language.setLocale(const Locale('ar'));
                    });
                  },
                ),
              ],
            ),
            const Divider(
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'English',
                  style: TextStyle(
                    fontSize: 16,
                    color: kMainTextColor,
                  ),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  value: !isArabic,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (bool? value) {
                    setState(() {
                      isArabic = !isArabic;
                      language.setLocale(const Locale('en'));
                    });
                  },
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
