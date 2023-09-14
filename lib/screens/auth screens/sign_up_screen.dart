// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/screens/auth%20screens/login_screen.dart';
import '../../helpers/colors.dart';
import '../../helpers/page_template.dart';
import '../../models/country.dart';
import '../../providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/entry_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../wrappers/wrapper_auth.dart';
import '../forget password screens/forget_password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  TextEditingController _userNameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _verifyPasswordController = TextEditingController();
  bool isObscureNew = true;

  bool _enable = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final heightNoNotch = height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context, listen: false);
    var local = AppLocalizations.of(context)!;

    final space = (20 / heightRatio) * height;
    final contentHeight = (677 / heightRatio) * height;
    final contentWidth = (335 / widthRatio) * width;
    final backHeight = (24 / heightRatio) * height;
    final backWidth = (24 / widthRatio) * width;
    final logoHeight = (183 / heightRatio) * height;
    final logoWidth = (259 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: PageTemplate(
          allowBack: false,
          title: local.create_account,
          txt: local.register_to_follow,
          children: [
            SizedBox(
              height: (38 / heightRatio) * height,
            ),
            // SizedBox(
            //   height: (60 / heightRatio) * height,
            //   width: (341 / widthRatio) * width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         width: (47 / widthRatio) * width,
            //         height: (47 / widthRatio) * width,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 1,
            //               blurRadius: 4,
            //               offset: Offset(0, 1), // changes position of shadow
            //             ),
            //           ],
            //         ),
            //         child: Container(
            //             height: (30 / heightRatio) * height,
            //             width: (24 / widthRatio) * width,
            //             alignment: Alignment.center,
            //             child: FittedBox(
            //               fit: BoxFit.contain,
            //               child: SvgPicture.asset(
            //                 "assets/images/facebook.svg",
            //                 height: (30 / heightRatio) * height,
            //                 width: (24 / widthRatio) * width,
            //                 fit: BoxFit.cover,
            //               ),
            //             )),
            //       ),
            //       Container(
            //         width: (47 / widthRatio) * width,
            //         height: (47 / widthRatio) * width,
            //         margin: EdgeInsets.symmetric(
            //             horizontal: (32 / widthRatio) * width),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 1,
            //               blurRadius: 4,
            //               offset: Offset(0, 1), // changes position of shadow
            //             ),
            //           ],
            //         ),
            //         child: Container(
            //             height: (30 / heightRatio) * height,
            //             width: (24 / widthRatio) * width,
            //             alignment: Alignment.center,
            //             child: FittedBox(
            //               fit: BoxFit.contain,
            //               child: SvgPicture.asset(
            //                 "assets/images/google.svg",
            //                 height: (30 / heightRatio) * height,
            //                 width: (24 / widthRatio) * width,
            //                 fit: BoxFit.cover,
            //               ),
            //             )),
            //       ),
            //       Container(
            //         width: (47 / widthRatio) * width,
            //         height: (47 / widthRatio) * width,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 1,
            //               blurRadius: 4,
            //               offset: Offset(0, 1), // changes position of shadow
            //             ),
            //           ],
            //         ),
            //         child: Container(
            //             height: (30 / heightRatio) * height,
            //             width: (24 / widthRatio) * width,
            //             alignment: Alignment.center,
            //             child: FittedBox(
            //               fit: BoxFit.contain,
            //               child: SvgPicture.asset(
            //                 "assets/images/apple.svg",
            //                 height: (30 / heightRatio) * height,
            //                 width: (24 / widthRatio) * width,
            //                 fit: BoxFit.cover,
            //               ),
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: space,
            // ),
            // SizedBox(
            //   height: (50 / heightRatio) * height,
            //   width: (343 / widthRatio) * width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       SizedBox(
            //           width: (149 / widthRatio) * width,
            //           child: const Divider(
            //             color: Color(0xffACB7CA),
            //             thickness: 1.5,
            //           )),
            //       AutoSizeText(
            //         local.or,
            //         style: const TextStyle(fontSize: 20),
            //       ),
            //       SizedBox(
            //           width: (149 / widthRatio) * width,
            //           child: const Divider(
            //             color: Color(0xffACB7CA),
            //             thickness: 1.5,
            //           )),
            //     ],
            //   ),
            // ),

            EntryField(
              label: local.first_name,
              obscure: false,
              hint: "moahmed",
              controller: _userNameController,
              icon: SvgPicture.asset(
                "assets/images/user.svg",
                color: kIconColor,
                fit: BoxFit.scaleDown,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            EntryField(
              label: local.email,
              obscure: false,
              hint: "example@gmail.com",
              controller: _emailController,
              icon: SvgPicture.asset(
                "assets/images/sms.svg",
                color: kIconColor,
                fit: BoxFit.scaleDown,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            // SizedBox(height: 10.0),
            EntryField(
              label: local.password,
              obscure: isObscureNew,
              controller: _passwordController,
              hint: "*****************",
              icon: SvgPicture.asset(
                "assets/images/lock.svg",
                color: kIconColor,
                fit: BoxFit.scaleDown,
              ),
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    isObscureNew = !isObscureNew;
                  });
                },
                child: !isObscureNew
                    ? Icon(
                        Icons.remove_red_eye_outlined,
                        color: kIconColor,
                      )
                    : SvgPicture.asset(
                        "assets/images/eye.svg",
                        color: kIconColor,
                        fit: BoxFit.scaleDown,
                      ),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),

            EntryField(
              label: local.re_password,
              obscure: isObscureNew,
              controller: _verifyPasswordController,
              hint: "*****************",
              icon: SvgPicture.asset(
                "assets/images/lock.svg",
                color: kIconColor,
                fit: BoxFit.scaleDown,
              ),
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    isObscureNew = !isObscureNew;
                  });
                },
                child: !isObscureNew
                    ? Icon(
                        Icons.remove_red_eye_outlined,
                        color: kIconColor,
                      )
                    : SvgPicture.asset(
                        "assets/images/eye.svg",
                        color: kIconColor,
                        fit: BoxFit.scaleDown,
                      ),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),

            SizedBox(
              height: space / 2,
            ),
            SizedBox(
                height: (20 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: AutoSizeText(
                        local.remember_me,
                        style: TextStyle(color: kTextColor, fontSize: 12),
                      ),
                    ),
                    CustomSwitch(
                      value: _enable,
                      onChanged: (bool val) {
                        setState(() {
                          _enable = val;
                        });
                      },
                    )
                  ],
                )),
            SizedBox(
                height: (25 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: AutoSizeText(
                        local.i_forget_my_password,
                        style: TextStyle(color: kRedColor, fontSize: 12),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: space,
            ),
            SizedBox(
                height: (56 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: CustomButton(
                    txt: local.sign_up,
                    onTap: () async {
                      // final res =
                      //     await auth.signIn("edss@gmsil.com0", "1212");
                      if (_emailController.text.contains("@") &&
                          _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LoadingAlert();
                            });
                        final res = await auth
                            .register(
                          _userNameController.text,
                          _emailController.text,
                          _passwordController.text,
                        )
                            .catchError((e, s) {
                          Navigator.pop(context);
                          return false;
                        });
                        if (res) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => WrapperAuth(),
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert(
                                  title: "Wrong Credintial",
                                  msg:
                                      "Something went wrong please try again later ",
                                  action1: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: AutoSizeText(
                                      local.ok,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: kMainTextColor,
                                      ),
                                    ),
                                  ),
                                  action2: null,
                                );
                              });
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlert(
                                title: "Wrong Format",
                                msg:
                                    "make sure to enter valid email and password",
                                action1: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: AutoSizeText(
                                    local.ok,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: kMainTextColor,
                                    ),
                                  ),
                                ),
                                action2: null,
                              );
                            });
                      }
                    })),
            SizedBox(
              height: space,
            ),
            SizedBox(
                // height: (20 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      local.already_have_account,
                      style: TextStyle(color: kTextColor, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AutoSizeText(
                        " ${local.login} ",
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
