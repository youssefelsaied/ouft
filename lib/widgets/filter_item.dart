// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/colors.dart';

import '../helpers/dimintions.dart';

class FilterItem extends StatefulWidget {
  final Widget item;
  const FilterItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final itemHeight = (105 / heightRatio) * height;
    final itemWidth = (101 / widthRatio) * width;
    final imgHeight = (62 / heightRatio) * height;
    final imgWidth = (59 / widthRatio) * width;
    final rateHeight = (15 / heightRatio) * height;
    final rateWidth = (75 / widthRatio) * width;
    final txtHeight = (18 / heightRatio) * height;
    final stxtHeight = (12 / heightRatio) * height;
    final paddingHeight = (10 / heightRatio) * height;
    final txtWidth = (47 / widthRatio) * width;
    final marginWidth = (5 / widthRatio) * width;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: kMain2Color)),
          // width: itemWidth,
          // height: itemHeight,
          margin: EdgeInsets.symmetric(horizontal: marginWidth),
          padding: EdgeInsets.symmetric(
              horizontal: marginWidth, vertical: paddingHeight / 2),
          child: widget.item),
    );
  }
}
