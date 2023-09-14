// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../models/order_get.dart';
import '../../providers/locale_provider.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem item;
  const OrderItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LocaleProvider>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final itemHeight = (260 / heightRatio) * height;
    final itemWidth = (157 / widthRatio) * width;
    final boxHeight = (173 / heightRatio) * height;
    final boxWidth = (157 / widthRatio) * width;
    final imgHeight = (149 / heightRatio) * height;
    final imgWidth = (141 / widthRatio) * width;
    final rateHeight = (15 / heightRatio) * height;
    final txtHeight = (46 / heightRatio) * height;
    final desHeight = (18 / heightRatio) * height;
    final stxtHeight = (12 / heightRatio) * height;
    final txtWidth = (120 / widthRatio) * width;
    final quantityWidth = (20 / widthRatio) * width;
    final paddingWidth = (8 / widthRatio) * width;
    return GestureDetector(
      onTap: () {
        // Navigator.push<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => HospitalDetailsScreen(
        //       hospital: widget.item,
        //     ),
        //   ),
        // );
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
                    color: Colors.white),
                width: boxWidth,
                height: boxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingWidth / 2),
                          height: txtHeight,
                          width: txtWidth,
                          child: AutoSizeText(
                            widget.item.product.name,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingWidth / 2),
                          height: txtHeight,
                          width: quantityWidth,
                          child: AutoSizeText(
                            "X" + widget.item.quantity.toString(),
                            style: TextStyle(
                                color: kMain2Color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                            maxFontSize: 12,
                            minFontSize: 12,
                            maxLines: 2,
                          ),
                        ),
                      ],
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
                          Container(
                            height: desHeight,
                            child: Text(
                              widget.item.product.price.toString() + " AED",
                              style: TextStyle(
                                color: kMain2Color,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
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
                  child: Image.network(
                    widget.item.product.image,
                    fit: BoxFit.cover,
                    // scale: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
