import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../providers/auth_provider.dart';
import '../../providers/locale_provider.dart';
import '../../screens/settings%20screen/appoinment_screen.dart';
import '../../screens/settings%20screen/favorites_screen.dart';
import '../../screens/settings%20screen/language_screen.dart';
import '../../screens/settings%20screen/orders_screen.dart';
import '../../screens/settings%20screen/setting_screen.dart';
import '../../widgets/settings_item.dart';
import '../../widgets/text_title.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../address_screens/address_show_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    var local = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (520 / heightRatio) * height;
    final buttonHeight = (70 / heightRatio) * height;
    final space = (16 / heightRatio) * height;
    return Scaffold(
      backgroundColor: kMainColor,
      // appBar: AppBar(
      //   backgroundColor: kCardBackgroundColor,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: const Texttitle(title: 'الحساب الشخصي'),
      // ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: (20 / heightRatio) * height,
                ),
                SizedBox(
                  height: space,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kWhiteColor),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: kMainColor),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.asset(
                        "assets/images/user.png",
                        height: buttonHeight,
                      ),
                    ),
                  ),
                ),
                AutoSizeText(
                  auth.theUser == null ? "Guest" : auth.theUser!.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: kWhiteColor,
                  ),
                ),
                auth.theUser == null
                    ? Container()
                    : AutoSizeText(
                        auth.theUser!.email,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: kWhiteColor,
                        ),
                      ),
              ],
            ),
            Container(
              height: contentHeight,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0)),
                  color: kWhiteColor,
                  border: Border.all(width: 2, color: kWhiteColor)),
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                children: auth.theUser == null
                    ? [
                        SettingItem(
                          title: "Privacy Policy",
                          icon: 'document-text',
                          onPressed: () {
                            // Navigator.push<void>(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) => AppoinmentScreen(),
                            //   ),
                            // );
                          },
                        ),
                        // SettingItem(
                        //   title: 'طريقة الدفع',
                        //   icon: 'card',
                        //   onPressed: () {},
                        // ),
                        SettingItem(
                          title: local.language,
                          icon: 'language',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    LanguageScreen(),
                              ),
                            );
                          },
                        ),
                      ]
                    : [
                        SettingItem(
                          title: "Edit Profile",
                          icon: 'settings',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    SettingScreen(),
                              ),
                            );
                          },
                        ),
                        SettingItem(
                          title: local.favorite,
                          icon: 'fav',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    FavoritesScreenn(),
                              ),
                            );
                          },
                        ),
                        SettingItem(
                          title: local.orders,
                          icon: 'briefcase',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    OrdersScreen(),
                              ),
                            );
                          },
                        ),
                        SettingItem(
                          title: local.appoiment,
                          icon: 'briefcase',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    AppoinmentScreen(),
                              ),
                            );
                          },
                        ),
                        SettingItem(
                          title: "Delivery Address",
                          icon: 'notification',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    AddressShowScreen(),
                              ),
                            );
                          },
                        ),

                        SettingItem(
                          title: "Privacy Policy",
                          icon: 'document-text',
                          onPressed: () {
                            // Navigator.push<void>(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) => AppoinmentScreen(),
                            //   ),
                            // );
                          },
                        ),
                        // SettingItem(
                        //   title: 'طريقة الدفع',
                        //   icon: 'card',
                        //   onPressed: () {},
                        // ),
                        SettingItem(
                          title: local.language,
                          icon: 'language',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    LanguageScreen(),
                              ),
                            );
                          },
                        ),

                        SettingItem(
                          title: local.setting,
                          icon: 'settings',
                          onPressed: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    SettingScreen(),
                              ),
                            );
                          },
                        ),
                        // SettingItem(
                        //   title: "Delete Account",
                        //   icon: 'trash',
                        //   onPressed: () {

                        //   },
                        // ),

                        SettingItem(
                          title: "Delete Account",
                          icon: 'trash',
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      // height: boxHeight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width * .025,
                                          vertical: height * .02),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: kWhiteColor,
                                          border: Border.all(
                                              width: 1.25, color: kWhiteColor)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              local.remove,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: kRedColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  (10 / heightRatio) * height,
                                            ),
                                            AutoSizeText(
                                              local.account,
                                              maxLines: 4,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ksecondTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  (20 / heightRatio) * height,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: AutoSizeText(
                                                    local.no,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kRedColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    thickness: 2.5,
                                                    color: kContainerTextColor,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // Navigation
                                                    Navigator.pop(context);

                                                    auth.logout();
                                                    auth.deleteAccount(
                                                        "123456");
                                                  },
                                                  child: AutoSizeText(
                                                    local.confirm,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kMainTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          isLogOut: true,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      // height: boxHeight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width * .025,
                                          vertical: height * .02),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: kWhiteColor,
                                          border: Border.all(
                                              width: 1.25, color: kWhiteColor)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AutoSizeText(
                                              local.logout,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: kRedColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  (10 / heightRatio) * height,
                                            ),
                                            AutoSizeText(
                                              local.logout_txt,
                                              maxLines: 4,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: ksecondTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  (20 / heightRatio) * height,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: AutoSizeText(
                                                    local.no,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kRedColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    thickness: 2.5,
                                                    color: kContainerTextColor,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // Navigation
                                                    Navigator.pop(context);

                                                    auth.logout();
                                                  },
                                                  child: AutoSizeText(
                                                    local.confirm,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: kMainTextColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Center(
                              child: AutoSizeText(
                            local.logout,
                            style: TextStyle(
                                color: Color(0xffEA3549),
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2),
                          )),
                        ),
                        SizedBox(
                          height: space,
                        )
                      ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
