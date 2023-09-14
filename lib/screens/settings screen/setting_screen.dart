// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/entry_field.dart';
import '../../widgets/text_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../providers/auth_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isObscureCurrent = true;
  bool isObscureNew = true;
  String countryCodeCurrent = "+974";
  String countryCodeNew = "+974";

  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _oldEmailController = TextEditingController();
  TextEditingController _newEmailController = TextEditingController();
  TextEditingController _oldPhoneController = TextEditingController();
  TextEditingController _newPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final auth = Provider.of<Auth>(context, listen: false);
    final language = Provider.of<LocaleProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final fullEntryWidth = (343 / widthRatio) * width;
    final countryCodeHeight = (48 / heightRatio) * height;
    final countryCodeWidth = (101 / widthRatio) * width;
    final phoneWidth = (226 / widthRatio) * width;
    final iconWidth = (24 / widthRatio) * width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kCardBackgroundColor,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Texttitle(title: local.settings),
          // automaticallyImplyLeading: false,
        ),
        backgroundColor: kCardBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                EntryField(
                  label: local.current_password,
                  obscure: isObscureCurrent,
                  controller: _oldPasswordController,
                  hint: "*****************",
                  icon: SvgPicture.asset(
                    "assets/images/lock.svg",
                    color: kIconColor,
                    fit: BoxFit.scaleDown,
                  ),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        isObscureCurrent = !isObscureCurrent;
                      });
                    },
                    child: !isObscureCurrent
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
                  label: local.new_password,
                  obscure: isObscureNew,
                  controller: _newPasswordController,
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
                  height: (30 / heightRatio) * height,
                ),
                SizedBox(
                    height: (56 / heightRatio) * height,
                    width: (250 / widthRatio) * width,
                    child: CustomButton(
                      txt: local.save_changes,
                      onTap: () async {
                        if (_oldPasswordController.text.isNotEmpty &&
                            _newPasswordController.text.isNotEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return LoadingAlert();
                              });
                          final response = await auth.changePassword(
                              _oldPasswordController.text,
                              _newPasswordController.text);
                          Navigator.pop(context);
                          _oldPasswordController.clear();
                          _newPasswordController.clear();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert(
                                  title: local.password,
                                  msg: response,
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
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert(
                                  title: "Wrong Format",
                                  msg: "Please enter current and new passwords",
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
                      },
                      radius: 30.0,
                    )),
                EntryField(
                  label: local.current_email,
                  obscure: false,
                  hint: "example@gmail.com",
                  icon: SvgPicture.asset(
                    "assets/images/sms.svg",
                    color: kIconColor,
                    fit: BoxFit.scaleDown,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                EntryField(
                  label: local.new_email,
                  obscure: false,
                  hint: "example@gmail.com",
                  icon: SvgPicture.asset(
                    "assets/images/sms.svg",
                    color: kIconColor,
                    fit: BoxFit.scaleDown,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                SizedBox(
                  height: (30 / heightRatio) * height,
                ),
                SizedBox(
                    height: (56 / heightRatio) * height,
                    width: (250 / widthRatio) * width,
                    child: CustomButton(
                      txt: local.save_changes,
                      onTap: () {},
                      radius: 30.0,
                    )),
                SizedBox(
                  height: (30 / heightRatio) * height,
                ),
              ],
            ),
          ),
        ));
  }
}
