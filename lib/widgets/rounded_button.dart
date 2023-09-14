import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/dimintions.dart';

class RoundedButton extends StatelessWidget {
  final txt;
  Function() onTap;
  Color color;
  Color txtColor;
  final double radius;
  RoundedButton({
    super.key,
    required this.txt,
    required this.onTap,
    this.radius = 15.0,
    this.color = const Color(0xffF2F3F6),
    this.txtColor = const Color(0xffA1A1A1),
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final iconHeight = (22 / heightRatio) * height;
    final iconWidth = (22 / widthRatio) * width;

    return InkWell(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: width * .05),
        // padding: const EdgeInsets.all(
        //   5,
        // ),
        height: iconWidth,
        width: iconWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: AutoSizeText(
          txt,
          style: TextStyle(
              color: txtColor, fontWeight: FontWeight.w500, fontSize: 30),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }
}
