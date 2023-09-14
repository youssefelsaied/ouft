import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,
      this.isLogOut = false});
  final String title;
  final String icon;
  final bool isLogOut;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: lightBlueColor,
                        radius: 25.0,
                        child: SvgPicture.asset(
                          "assets/images/$icon.svg",
                          height: (30 / heightRatio) * height,
                          width: (24 / widthRatio) * width,
                          fit: BoxFit.cover,
                          color: isLogOut ? kRedColor : kMainColor,
                        ),
                      ),
                      SizedBox(
                        width: (15 / widthRatio) * width,
                      ),
                      AutoSizeText(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: isLogOut ? kRedColor : kMainTextColor,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff73565A),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
