import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

class CustomButton extends StatelessWidget {
  final txt;
  final Widget? icon;
  Function() onTap;
  final double radius;
  final double textSize;
  CustomButton({
    super.key,
    required this.txt,
    required this.onTap,
    this.icon,
    this.radius = 8.0,
    this.textSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = (20 / widthRatio) * width;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * .01),
        padding: EdgeInsets.symmetric(
          vertical: width * .01,
        ),
        alignment: Alignment.center,
        // height: (30 / 804) * height,
        // width: (131 / 375) * width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[kMainColor, kMainColor],
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: textSize),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            icon == null
                ? SizedBox()
                : Row(
                    children: [
                      SizedBox(
                        width: space,
                      ),
                      icon!,
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
