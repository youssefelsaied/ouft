import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:ouft/helpers/page_template.dart';
import '../../widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/dimintions.dart';
import '../../widgets/text_title.dart';
import '../main screens/home_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var local = AppLocalizations.of(context)!;

    final space = (20 / heightRatio) * height;
    final contentHeight = (88 / heightRatio) * height;
    final contentWidth = (72 / widthRatio) * width;
    final paddingWidth = (10 / widthRatio) * width;
    final itemHeight = (193 / heightRatio) * height;
    final itemWidth = (164 / widthRatio) * width;
    return PageTemplate(
      title: local.notification,
      txt: "جميع الإشعارات الخاصة بك",
      allowBack: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Texttitle(title: "اليـــوم"),
            // Column(
            //   children: doctors
            //       .map((e) => FittedBox(
            //             fit: BoxFit.scaleDown,
            //             child: FadedScaleAnimation(
            //               const NotificationItem(),
            //               durationInMilliseconds: 300,
            //             ),
            //           ))
            //       .toList(),
            // ),
          ],
        )
      ],

      // List<Widget>.generate(doctors.length, (index) {
      //   return FittedBox(
      //     fit: BoxFit.scaleDown,
      //     child: FadedScaleAnimation(
      //       const NotificationItem(),
      //       durationInMilliseconds: 300,
      //     ),
      //   );
      // }).toList()
    );
    // Scaffold(
    //     backgroundColor: kCardBackgroundColor,
    //     appBar: AppBar(
    //       systemOverlayStyle:
    //           SystemUiOverlayStyle.dark, // or use SystemUiOverlayStyle.light

    //       title: Texttitle(title: local.notification),
    //       iconTheme: IconThemeData(color: kBackIconColor),
    //       elevation: 0,
    //       backgroundColor: Colors.transparent,
    //     ),
    //     body: ListView(
    //       children: List<Widget>.generate(doctors.length, (index) {
    //         return FittedBox(
    //           fit: BoxFit.scaleDown,
    //           child: FadedScaleAnimation(
    //             const NotificationItem(),
    //             durationInMilliseconds: 300,
    //           ),
    //         );
    //       }),
    //     ));
  }
}
