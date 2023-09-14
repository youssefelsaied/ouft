// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../helpers/colors.dart';

import '../helpers/dimintions.dart';

class ServiceWidget extends StatefulWidget {
  Widget icon;
  String title;
  String subTitle;
  Color color;
  ServiceWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color = const Color(0xffD9A1AA),
  }) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final itemHeight = (134 / heightRatio) * height;
    final itemWidth = (157 / widthRatio) * width;
    final boxHeight = (173 / heightRatio) * height;
    final boxWidth = (157 / widthRatio) * width;
    final imgHeight = (149 / heightRatio) * height;
    final imgWidth = (141 / widthRatio) * width;
    final rateHeight = (15 / heightRatio) * height;
    final txtHeight = (46 / heightRatio) * height;
    final desHeight = (18 / heightRatio) * height;
    final stxtHeight = (12 / heightRatio) * height;
    final txtWidth = (136 / widthRatio) * width;
    final paddingWidth = (8 / widthRatio) * width;
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 8),
        // width: itemWidth,
        // height: itemHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.icon,
            SizedBox(
              width: paddingWidth * 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.title,
                  style: TextStyle(
                      color: widget.color,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: (8 / heightRatio) * height,
                ),
                SizedBox(
                  width: (250 / widthRatio) * width,
                  child: AutoSizeText(
                    widget.subTitle,
                    style: TextStyle(color: widget.color),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
