import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/entry_field.dart';
import '../../widgets/text_title.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({super.key});

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  String countryCode = "+974";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final language = Provider.of<LocaleProvider>(context, listen: false);

    final fullEntryWidth = (343 / widthRatio) * width;
    final countryCodeHeight = (48 / heightRatio) * height;
    final countryCodeWidth = (101 / widthRatio) * width;
    final phoneWidth = (226 / widthRatio) * width;
    final iconWidth = (24 / widthRatio) * width;
    final space = (30 / widthRatio) * width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCardBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Texttitle(title: 'تــــأكيد الطلـــب'),
      ),
      backgroundColor: kCardBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              EntryField(
                label: "أسم المستخدم",
                obscure: false,
                hint: "محمد محمود ابراهيم ",
                icon: SvgPicture.asset(
                  "assets/images/user.svg",
                  color: kIconColor,
                  fit: BoxFit.scaleDown,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              EntryField(
                label: "البريد الالكتروني",
                obscure: false,
                hint: "example@gmail.com",
                icon: SvgPicture.asset(
                  "assets/images/sms.svg",
                  color: kIconColor,
                  fit: BoxFit.scaleDown,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Container(
                // color: Colors.red,
                width: fullEntryWidth,
                // height: fullEntryWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: phoneWidth,
                      child: EntryField(
                        label: "رقم الهاتف",
                        obscure: false,
                        hint: "597792884",
                        // prefixIcon: Icons.location_on_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: (6 / 804) * height,
                      ),
                      width: countryCodeWidth,
                      height: countryCodeHeight,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: CountryCodePicker(
                        hideMainText: true,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            countryCode = value.toString();
                          });
                        },
                        // textStyle: TextStyle(fontSize: 12),

                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: countryCode,
                        favorite: ['+20', 'EG', '+974', 'QA'],
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        flagWidth: iconWidth * 2,
                      ),
                    ),
                  ],
                ),
              ),
              EntryField(
                label: "العنوان",
                obscure: false,
                icon: SvgPicture.asset(
                  "assets/images/address.svg",
                  color: kIconColor,
                  fit: BoxFit.scaleDown,
                ),
                hint: "أكتـب عنوانك هنا",
                prefixIcon: Icons.location_on_outlined,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              SizedBox(
                height: space,
              ),
              SizedBox(
                  height: (45 / heightRatio) * height,
                  width: (210 / widthRatio) * width,
                  child: CustomButton(
                    txt: "الذهاب للدفع",
                    onTap: () {},
                    radius: 30.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
