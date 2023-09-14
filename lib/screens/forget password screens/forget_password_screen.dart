import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:ouft/providers/auth_provider.dart';
import '../../helpers/colors.dart';
import '../../models/country.dart';
import '../../screens/forget%20password%20screens/check_code_screen.dart';
import 'package:provider/provider.dart';

import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/entry_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  List<CountryData> defaultCountries = [
    CountryData(
        id: 1,
        title: "قطر",
        img: "https://v1.mawaed.thiqa-serv.com/assets/img/countries/1.png",
        code: "+974",
        count: 8)
  ];

  @override
  void initState() {
    final auth = Provider.of<Auth>(context, listen: false);

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    selectedCountry =
        auth.countries.isEmpty ? defaultCountries[0] : auth.countries[0];
    super.initState();
  }

  String countryCode = "+974";
  CountryData? selectedCountry;
  TextEditingController _phoneController = TextEditingController();

  final GlobalKey _dropdownButtonKey = GlobalKey();

  void openDropdown() {
    GestureDetector? detector = GestureDetector();
    void searchForGestureDetector(BuildContext element) {
      element.visitChildElements((element) {
        if (element.widget != null && element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
          return;
        } else {
          searchForGestureDetector(element);
        }

        return;
      });
    }

    searchForGestureDetector(_dropdownButtonKey.currentContext!);
    assert(detector != null);

    detector!.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context, listen: false);
    var local = AppLocalizations.of(context)!;

    final contentHeight = (497 / heightRatio) * height;
    final contentWidth = (335 / widthRatio) * width;
    final backHeight = (24 / heightRatio) * height;
    final backWidth = (24 / widthRatio) * width;
    final logoHeight = (316 / heightRatio) * height;
    final logoWidth = (316 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;

    final bigSpace = (90 / heightRatio) * height;
    final fullEntryHeight = (48 / heightRatio) * height;
    final fullEntryWidth = (343 / widthRatio) * width;
    final countryCodeHeight = (48 / heightRatio) * height;
    final countryCodeWidth = (101 / widthRatio) * width;
    final phoneWidth = (226 / widthRatio) * width;
    final smallEntryHeight = (48 / heightRatio) * height;
    final smallEntryWidth = (163 / widthRatio) * width;
    final iconHeight = (24 / heightRatio) * height;
    final iconWidth = (24 / widthRatio) * width;
    final dropdown = DropdownButton<CountryData>(
      elevation: 2,
      underline: const Text(""),
      value: selectedCountry,
      key: _dropdownButtonKey,
      // itemHeight: countryCodeHeight,
      // alignment: Alignment.centerRight,
      // isExpanded: true,
      // hint: const Text("Select City"),

      alignment: AlignmentDirectional.centerEnd,
      borderRadius: BorderRadius.circular(12),
      items: auth.countries.isEmpty
          ? defaultCountries
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    // color: Colors.red,
                    // height: countryCodeHeight,
                    // width: countryCodeWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          " ${e.code} ",
                          style: const TextStyle(fontSize: 12),
                          // fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          height: countryCodeHeight / 1.1,
                          child: Image.network(
                            e.img,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  )))
              .toList()
          : auth.countries
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    // color: Colors.red,
                    // height: countryCodeHeight,
                    // width: countryCodeWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          " ${e.code} ",
                          style: const TextStyle(fontSize: 12),
                          // fit: BoxFit.scaleDown,
                        ),
                        SizedBox(
                          height: countryCodeHeight / 1.1,
                          child: Image.network(
                            e.img,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  )))
              .toList(),

      // [
      //   DropdownMenuItem(value: auth., child: Text('1')),
      //   DropdownMenuItem(value: 2, child: Text('2')),
      //   DropdownMenuItem(value: 3, child: Text('3')),
      // ],
      // onChanged: (int value) {
      //   setState(() {});
      // },
      onChanged: (value) {
        setState(() {
          selectedCountry = value;
        });
      },
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PageTemplate(
          contentHeight: 608,
          title: local.i_forget_my_password,
          txt: "Type phone number",
          allowBack: true,
          children: [
            SizedBox(
              height: bigSpace,
            ),
            SizedBox(
              // color: Colors.red,
              width: fullEntryWidth,
              // height: fullEntryWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(local.phone),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          openDropdown();
                        },
                        child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: (4 / 804) * height,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: (4 / 804) * height,
                                horizontal: (0 / widthRatio) * width),
                            width: countryCodeWidth,
                            height: countryCodeHeight,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dropdown,
                              ],
                            )),
                      ),
                      SizedBox(
                        width: phoneWidth,
                        child: EntryField(
                          // label: local.phone,
                          controller: _phoneController,
                          obscure: false,
                          hint: "597792884",
                          // prefixIcon: Icons.location_on_outlined,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: bigSpace / 4,
            ),
            Container(
                alignment: Alignment.center,
                height: (20 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: AutoSizeText(
                  "سيتم إرسال كود الى رقم الهاتف",
                  style: TextStyle(color: kTextColor, fontSize: 10),
                )),
            SizedBox(
              height: bigSpace / 4,
            ),
            SizedBox(
                height: (56 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: CustomButton(
                    txt: "إرسال كود",
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const CheckCodeScreen(),
                        ),
                      );
                    })),
            SizedBox(
              height: bigSpace / 5,
            ),
            SizedBox(
                height: (25 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "لم يتم إرسال كود",
                      style: TextStyle(color: kTextColor, fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {},
                      child: AutoSizeText(
                        " إرسال كود مره أخرى",
                        style: TextStyle(color: kMain2Color, fontSize: 12),
                      ),
                    ),
                  ],
                )),
          ]),
    );
  }
}
