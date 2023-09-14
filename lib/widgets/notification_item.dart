import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../widgets/stars.dart';

import '../helpers/dimintions.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final itemHeight = (70 / heightRatio) * height;
    final itemWidth = (343 / widthRatio) * width;
    final imgHeight = (39 / heightRatio) * height;
    final imgWidth = (39 / widthRatio) * width;
    final txtHeight = (93 / heightRatio) * height;
    final txtWidth = (271 / widthRatio) * width;
    final bigtxtWidth = (240 / widthRatio) * width;
    final paddingWidth = (8 / widthRatio) * width;
    final marginHeight = (8 / heightRatio) * height;
    // final width = size.width;
    return Container(
      // height: itemHeight,
      width: itemWidth,
      margin: EdgeInsets.symmetric(vertical: marginHeight),
      padding: EdgeInsets.symmetric(
        horizontal: paddingWidth,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kLightTextColor,
          border: Border.all(width: 1.25, color: kWhiteColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(imgWidth),
            child: Container(
              color: Colors.red,
              height: imgWidth,
              width: imgWidth,
              child: Image.asset(
                "assets/images/doctor2.png",
                // height: height,
                height: imgWidth,
                width: imgWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            // height: txtHeight,
            padding: EdgeInsets.symmetric(vertical: marginHeight),
            width: txtWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      'د.أحمد محمود',
                      style: TextStyle(
                        fontSize: 20,
                        color: kMainTextColor,
                      ),
                    ),
                    AutoSizeText(
                      '8:50pm',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: ksecondTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: bigtxtWidth,
                  child: AutoSizeText(
                    'هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي ',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: ksecondTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
