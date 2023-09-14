import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/helpers/page_template.dart';
import '../../helpers/colors.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/entry_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckCodeScreen extends StatefulWidget {
  const CheckCodeScreen({super.key});

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  String countryCode = "+974";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final logoHeight = (316 / heightRatio) * height;
    final logoWidth = (316 / widthRatio) * width;
    final pinHeight = (66 / heightRatio) * height;
    final pinWidth = (66 / widthRatio) * width;

    final fullEntryWidth = (312 / widthRatio) * width;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: PageTemplate(
          contentHeight: 608,
          title: "أدخل الكود",
          txt: "قم بكتابة كود التحقق الذى وصل هاتفك",
          allowBack: true,
          children: [
            SizedBox(
              height: (112 / heightRatio) * height,
            ),
            Container(
              width: fullEntryWidth,
              // height: fullEntryHeight,
              child: PinCodeTextField(
                enableActiveFill: true,
                appContext: context,
                // pastedTextStyle: TextStyle(
                //   color: Color(0xffE1F5F4),
                //   // fontWeight: FontWeight.bold,
                // ),
                length: 4,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 4) {
                    return "";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: pinHeight,
                  fieldWidth: pinWidth,
                  activeColor: Color(0xffF4F4F4),
                  inactiveColor: Color(0xffF4F4F4),
                  activeFillColor: Color(0xffF4F4F4),
                  inactiveFillColor: Color(0xffF4F4F4),
                  selectedColor: kTextColor,
                  selectedFillColor: Color(0xffF4F4F4),
                  // disabledColor: Theme.of(context).canvasColor,
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            SizedBox(
                height: (56 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: CustomButton(txt: "تم", onTap: () {})),
          ]),
    );
  }
}
