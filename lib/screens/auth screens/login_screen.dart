// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:ouft/screens/auth%20screens/sign_up_screen.dart';
import 'package:ouft/wrappers/wrapper_home.dart';
import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../helpers/colors.dart';
import '../../providers/auth_provider.dart';
import '../../screens/forget%20password%20screens/forget_password_screen.dart';
import 'package:provider/provider.dart';

import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_switch.dart';
import '../../widgets/entry_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../wrappers/wrapper_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  bool _enable = true;

  bool isObscureNew = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
          contentHeight: 650,
          allowBack: false,
          title: local.welcome_back,
          txt: local.login_to_follow,
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
            SizedBox(
                height: (25 / heightRatio) * height,
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
                        local.i_forget_my_password,
                        style: TextStyle(color: kMainColor, fontSize: 12),
                      ),
                    ),
                  ],
                )),

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
              height: space * 5,
            ),
            SizedBox(
                height: (56 / heightRatio) * height,
                width: (335 / widthRatio) * width,
                child: CustomButton(
                    txt: local.login,
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
                            .signIn(_emailController.text,
                                _passwordController.text, _enable)
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
                      local.dont_have_account,
                      style: TextStyle(color: kTextColor, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SignUpScreen(),
                          ),
                        );
                      },
                      child: AutoSizeText(
                        " ${local.sign_up} ",
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                )),
            // SizedBox(
            //   height: space,
            // ),
            // SizedBox(
            //     height: (56 / heightRatio) * height,
            //     width: (335 / widthRatio) * width,
            //     child: CustomButton(
            //         txt: local.take_a_tour,
            //         onTap: () async {
            //           Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute<void>(
            //               builder: (BuildContext context) => WrapperHome(),
            //             ),
            //           );
            //         })),
          ],
        )

        //  GestureDetector(
        //   onTap: () {
        //     FocusScopeNode currentFocus = FocusScope.of(context);

        //     if (!currentFocus.hasPrimaryFocus) {
        //       currentFocus.unfocus();
        //     }
        //   },
        //   child: Scaffold(
        //     backgroundColor: kMainColor,
        //     // appBar: AppBar(
        //     //   backgroundColor: kMainColor,
        //     //   foregroundColor: Colors.black,
        //     //   elevation: 0,
        //     //   title: AutoSizeText(
        //     //     local.login,
        //     //     style: TextStyle(color: Colors.white),
        //     //   ),
        //     // ),
        //     body: AnnotatedRegion<SystemUiOverlayStyle>(
        //       value: SystemUiOverlayStyle.dark,
        //       child: Container(
        //         child: SingleChildScrollView(
        //           child: Container(
        //             height: height,
        //             // color: Colors.red,
        //             child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   SizedBox(
        //                     height: space,
        //                   ),
        //                   Container(
        //                       color: kMainColor,
        //                       // height: backHeight,
        //                       child: AutoSizeText(
        //                         local.login,
        //                         style: const TextStyle(
        //                             color: Colors.white, fontSize: 20),
        //                       )),
        //                   Container(
        //                       color: kMainColor,
        //                       // height: backHeight,
        //                       child: AutoSizeText(
        //                         local.login_to_follow,
        //                         style: const TextStyle(
        //                             color: Colors.white, fontSize: 16),
        //                       )),
        //                   Container(
        //                     width: width,
        //                     height: contentHeight,
        //                     decoration: BoxDecoration(
        //                         color: kCardBackgroundColor,
        //                         // ignore: prefer_const_constructors
        //                         borderRadius: BorderRadius.only(
        //                           topLeft: const Radius.circular(50),
        //                           topRight: const Radius.circular(50),
        //                         )),
        //                     child: Column(
        //                       children: [
        //                         SizedBox(
        //                           height: (38 / heightRatio) * height,
        //                         ),
        //                         SizedBox(
        //                           height: (60 / heightRatio) * height,
        //                           width: (341 / widthRatio) * width,
        //                           child: Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               Container(
        //                                 width: (47 / widthRatio) * width,
        //                                 height: (47 / widthRatio) * width,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(50),
        //                                   color: Colors.white,
        //                                   boxShadow: [
        //                                     BoxShadow(
        //                                       color: Colors.grey.withOpacity(0.5),
        //                                       spreadRadius: 1,
        //                                       blurRadius: 4,
        //                                       offset: Offset(0,
        //                                           1), // changes position of shadow
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 child: Container(
        //                                     height: (30 / heightRatio) * height,
        //                                     width: (24 / widthRatio) * width,
        //                                     alignment: Alignment.center,
        //                                     child: FittedBox(
        //                                       fit: BoxFit.contain,
        //                                       child: SvgPicture.asset(
        //                                         "assets/images/facebook.svg",
        //                                         height:
        //                                             (30 / heightRatio) * height,
        //                                         width: (24 / widthRatio) * width,
        //                                         fit: BoxFit.cover,
        //                                       ),
        //                                     )),
        //                               ),
        //                               Container(
        //                                 width: (47 / widthRatio) * width,
        //                                 height: (47 / widthRatio) * width,
        //                                 margin: EdgeInsets.symmetric(
        //                                     horizontal:
        //                                         (32 / widthRatio) * width),
        //                                 decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(50),
        //                                   color: Colors.white,
        //                                   boxShadow: [
        //                                     BoxShadow(
        //                                       color: Colors.grey.withOpacity(0.5),
        //                                       spreadRadius: 1,
        //                                       blurRadius: 4,
        //                                       offset: Offset(0,
        //                                           1), // changes position of shadow
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 child: Container(
        //                                     height: (30 / heightRatio) * height,
        //                                     width: (24 / widthRatio) * width,
        //                                     alignment: Alignment.center,
        //                                     child: FittedBox(
        //                                       fit: BoxFit.contain,
        //                                       child: SvgPicture.asset(
        //                                         "assets/images/google.svg",
        //                                         height:
        //                                             (30 / heightRatio) * height,
        //                                         width: (24 / widthRatio) * width,
        //                                         fit: BoxFit.cover,
        //                                       ),
        //                                     )),
        //                               ),
        //                               Container(
        //                                 width: (47 / widthRatio) * width,
        //                                 height: (47 / widthRatio) * width,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius: BorderRadius.circular(50),
        //                                   color: Colors.white,
        //                                   boxShadow: [
        //                                     BoxShadow(
        //                                       color: Colors.grey.withOpacity(0.5),
        //                                       spreadRadius: 1,
        //                                       blurRadius: 4,
        //                                       offset: Offset(0,
        //                                           1), // changes position of shadow
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 child: Container(
        //                                     height: (30 / heightRatio) * height,
        //                                     width: (24 / widthRatio) * width,
        //                                     alignment: Alignment.center,
        //                                     child: FittedBox(
        //                                       fit: BoxFit.contain,
        //                                       child: SvgPicture.asset(
        //                                         "assets/images/apple.svg",
        //                                         height:
        //                                             (30 / heightRatio) * height,
        //                                         width: (24 / widthRatio) * width,
        //                                         fit: BoxFit.cover,
        //                                       ),
        //                                     )),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           height: space,
        //                         ),
        //                         SizedBox(
        //                           height: (50 / heightRatio) * height,
        //                           width: (343 / widthRatio) * width,
        //                           child: Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               SizedBox(
        //                                   width: (149 / widthRatio) * width,
        //                                   child: const Divider(
        //                                     color: Color(0xffACB7CA),
        //                                     thickness: 1.5,
        //                                   )),
        //                               AutoSizeText(
        //                                 local.or,
        //                                 style: const TextStyle(fontSize: 20),
        //                               ),
        //                               SizedBox(
        //                                   width: (149 / widthRatio) * width,
        //                                   child: const Divider(
        //                                     color: Color(0xffACB7CA),
        //                                     thickness: 1.5,
        //                                   )),
        //                             ],
        //                           ),
        //                         ),

        //                         EntryField(
        //                           label: local.email,
        //                           obscure: false,
        //                           hint: "example@gmail.com",
        //                           controller: _emailController,
        //                           icon: SvgPicture.asset(
        //                             "assets/images/sms.svg",
        //                             color: kIconColor,
        //                             fit: BoxFit.scaleDown,
        //                           ),
        //                           color:
        //                               Theme.of(context).scaffoldBackgroundColor,
        //                         ),
        //                         // SizedBox(height: 10.0),
        //                         EntryField(
        //                           label: local.password,
        //                           obscure: isObscureNew,
        //                           controller: _passwordController,
        //                           hint: "*****************",
        //                           icon: SvgPicture.asset(
        //                             "assets/images/lock.svg",
        //                             color: kIconColor,
        //                             fit: BoxFit.scaleDown,
        //                           ),
        //                           suffix: InkWell(
        //                             onTap: () {
        //                               setState(() {
        //                                 isObscureNew = !isObscureNew;
        //                               });
        //                             },
        //                             child: !isObscureNew
        //                                 ? Icon(
        //                                     Icons.remove_red_eye_outlined,
        //                                     color: kIconColor,
        //                                   )
        //                                 : SvgPicture.asset(
        //                                     "assets/images/eye.svg",
        //                                     color: kIconColor,
        //                                     fit: BoxFit.scaleDown,
        //                                   ),
        //                           ),
        //                           color:
        //                               Theme.of(context).scaffoldBackgroundColor,
        //                         ),
        //                         SizedBox(
        //                             height: (25 / heightRatio) * height,
        //                             width: (335 / widthRatio) * width,
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 InkWell(
        //                                   onTap: () {
        //                                     Navigator.push<void>(
        //                                       context,
        //                                       MaterialPageRoute<void>(
        //                                         builder: (BuildContext context) =>
        //                                             const ForgetPasswordScreen(),
        //                                       ),
        //                                     );
        //                                   },
        //                                   child: AutoSizeText(
        //                                     local.i_forget_my_password,
        //                                     style: TextStyle(
        //                                         color: kMainColor, fontSize: 12),
        //                                   ),
        //                                 ),
        //                               ],
        //                             )),

        //                         SizedBox(
        //                           height: space / 2,
        //                         ),
        //                         SizedBox(
        //                             height: (20 / heightRatio) * height,
        //                             width: (335 / widthRatio) * width,
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 InkWell(
        //                                   onTap: () {
        //                                     Navigator.push<void>(
        //                                       context,
        //                                       MaterialPageRoute<void>(
        //                                         builder: (BuildContext context) =>
        //                                             const ForgetPasswordScreen(),
        //                                       ),
        //                                     );
        //                                   },
        //                                   child: AutoSizeText(
        //                                     local.remember_me,
        //                                     style: TextStyle(
        //                                         color: kTextColor, fontSize: 12),
        //                                   ),
        //                                 ),
        //                                 CustomSwitch(
        //                                   value: _enable,
        //                                   onChanged: (bool val) {
        //                                     setState(() {
        //                                       _enable = val;
        //                                     });
        //                                   },
        //                                 )
        //                               ],
        //                             )),
        //                         SizedBox(
        //                           height: space * 5,
        //                         ),
        //                         SizedBox(
        //                             height: (56 / heightRatio) * height,
        //                             width: (335 / widthRatio) * width,
        //                             child: CustomButton(
        //                                 txt: local.login,
        //                                 onTap: () async {
        //                                   // final res =
        //                                   //     await auth.signIn("edss@gmsil.com0", "1212");
        //                                   if (_emailController.text
        //                                           .contains("@") &&
        //                                       _emailController.text.isNotEmpty &&
        //                                       _passwordController
        //                                           .text.isNotEmpty) {
        //                                     showDialog(
        //                                         context: context,
        //                                         builder: (BuildContext context) {
        //                                           return LoadingAlert();
        //                                         });
        //                                     final res = await auth
        //                                         .signIn(
        //                                             _emailController.text,
        //                                             _passwordController.text,
        //                                             _enable)
        //                                         .catchError((e, s) {
        //                                       Navigator.pop(context);
        //                                       return false;
        //                                     });
        //                                     if (res) {
        //                                       Navigator.pop(context);
        //                                       Navigator.pushReplacement(
        //                                         context,
        //                                         MaterialPageRoute<void>(
        //                                           builder:
        //                                               (BuildContext context) =>
        //                                                   WrapperAuth(),
        //                                         ),
        //                                       );
        //                                     } else {
        //                                       showDialog(
        //                                           context: context,
        //                                           builder:
        //                                               (BuildContext context) {
        //                                             return CustomAlert(
        //                                               title: "Wrong Credintial",
        //                                               msg:
        //                                                   "Something went wrong please try again later ",
        //                                               action1: InkWell(
        //                                                 onTap: () {
        //                                                   Navigator.pop(context);
        //                                                 },
        //                                                 child: AutoSizeText(
        //                                                   local.ok,
        //                                                   style: TextStyle(
        //                                                     fontSize: 20,
        //                                                     fontWeight:
        //                                                         FontWeight.w400,
        //                                                     color: kMainTextColor,
        //                                                   ),
        //                                                 ),
        //                                               ),
        //                                               action2: null,
        //                                             );
        //                                           });
        //                                     }
        //                                   } else {
        //                                     showDialog(
        //                                         context: context,
        //                                         builder: (BuildContext context) {
        //                                           return CustomAlert(
        //                                             title: "Wrong Format",
        //                                             msg:
        //                                                 "make sure to enter valid email and password",
        //                                             action1: InkWell(
        //                                               onTap: () {
        //                                                 Navigator.pop(context);
        //                                               },
        //                                               child: AutoSizeText(
        //                                                 local.ok,
        //                                                 style: TextStyle(
        //                                                   fontSize: 20,
        //                                                   fontWeight:
        //                                                       FontWeight.w400,
        //                                                   color: kMainTextColor,
        //                                                 ),
        //                                               ),
        //                                             ),
        //                                             action2: null,
        //                                           );
        //                                         });
        //                                   }
        //                                 })),
        //                         SizedBox(
        //                           height: space,
        //                         ),
        //                         SizedBox(
        //                             // height: (20 / heightRatio) * height,
        //                             width: (335 / widthRatio) * width,
        //                             child: Row(
        //                               mainAxisAlignment: MainAxisAlignment.center,
        //                               children: [
        //                                 AutoSizeText(
        //                                   local.dont_have_account,
        //                                   style: TextStyle(
        //                                       color: kTextColor, fontSize: 16),
        //                                 ),
        //                                 InkWell(
        //                                   onTap: () {
        //                                     Navigator.push<void>(
        //                                       context,
        //                                       MaterialPageRoute<void>(
        //                                         builder: (BuildContext context) =>
        //                                             const SignUpScreen(),
        //                                       ),
        //                                     );
        //                                   },
        //                                   child: AutoSizeText(
        //                                     " ${local.sign_up} ",
        //                                     style: TextStyle(
        //                                         color: kMain2Color,
        //                                         fontSize: 16,
        //                                         fontWeight: FontWeight.w700),
        //                                   ),
        //                                 ),
        //                               ],
        //                             )),
        //                       ],
        //                     ),
        //                   ),
        //                 ]),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

        );
  }
}
