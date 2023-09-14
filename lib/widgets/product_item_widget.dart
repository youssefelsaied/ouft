// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/colors.dart';
import '../models/home.dart';
import '../models/hospital.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import '../helpers/dimintions.dart';
import '../screens/product_screen/product_screen.dart';

class ProductItemWidget extends StatefulWidget {
  final OurProduct item;
  final bool home;
  const ProductItemWidget({
    Key? key,
    required this.item,
    required this.home,
  }) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final itemHeight = (260 / heightRatio) * height;
    final itemWidth = (157 / widthRatio) * width;
    final boxHeight = (173 / heightRatio) * height;
    final boxWidth = (157 / widthRatio) * width;
    final imgHeight = (149 / heightRatio) * height;
    final imgWidth = (141 / widthRatio) * width;
    final rateHeight = (15 / heightRatio) * height;
    final txtHeight = (30 / heightRatio) * height;
    final desHeight = (18 / heightRatio) * height;
    final stxtHeight = (12 / heightRatio) * height;
    final txtWidth = (136 / widthRatio) * width;
    final paddingWidth = (8 / widthRatio) * width;
    return GestureDetector(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ProductScreen(
              item: widget.item,
            ),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 8),
        // color: Colors.red,
        width: itemWidth,
        height: itemHeight,
        // color: Colors.red,
        child: Stack(
          // alignment: Alignment.topCenter,
          // fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: widget.home ? Colors.white : Color(0xffF4F4F4)),
                width: boxWidth,
                height: boxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: txtHeight,
                      width: txtWidth,
                      child: AutoSizeText(
                        widget.item.name,
                        style: TextStyle(
                            color: Color(0xff73565A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                        maxFontSize: 12,
                        minFontSize: 12,
                        maxLines: 2,
                      ),
                    ),

                    Container(
                      // width: txtWidth,
                      // color: Colors.red,
                      height: desHeight,
                      padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: paddingWidth),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.item.price == widget.item.finalPrice
                              ? Container()
                              : Container(
                                  height: desHeight,
                                  child: Text(
                                    widget.item.price.toString() + "  ",
                                    style: TextStyle(
                                        color: kMain2Color,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  ),
                                ),
                          Container(
                            // width: txtWidth,
                            height: desHeight,
                            child: Text(
                              widget.item.finalPrice.toString() + " AED",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: stxtHeight,
                    )
                    // Positioned(top: 6, left: 6, right: 6, child: Text(category.title!))
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                // color: Colors.red,
                width: imgWidth,
                height: imgHeight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FancyShimmerImage(
                      imageUrl: widget.item.image,
                      width: imgWidth,
                      height: imgHeight,
                      boxFit: BoxFit.cover,
                      errorWidget: Image.network(
                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                    )
//  Image.network(
//                     widget.item.image,
//                     fit: BoxFit.cover,
//                     // scale: 1,
//                   ),
                    ),
              ),
            ),
            Positioned(
                right: 3.5 * paddingWidth,
                top: paddingWidth,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    widget.item.bookmark
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: kMain2Color,
                    size: 13,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
