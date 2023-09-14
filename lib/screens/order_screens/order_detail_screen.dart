import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../models/order_get.dart';
import '../../providers/cart_provider.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/text_title.dart';
import 'order_item_widget.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderGetData item;

  const OrderDetailScreen({super.key, required this.item});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int flag = 1;
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final language = Provider.of<LocaleProvider>(context, listen: true);
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (620 / heightRatio) * height;
    final contentWidth = (327 / widthRatio) * width;
    final marginWidth = (24 / widthRatio) * width;
    final paddingWidth = (16 / widthRatio) * width;
    final imgWIdth = (50 / widthRatio) * width;
    final paddingHeight = (16 / heightRatio) * height;
    final buttonHeight = (56 / heightRatio) * height;
    final boxHeight = (150 / heightRatio) * height;
    String date = DateFormat("EE , dd MMMM yyyy").format(widget.item.time);
    String time = DateFormat("hh:mm:ss").format(widget.item.time);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCardBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Texttitle(title: "Order Details"),
      ),
      backgroundColor: kCardBackgroundColor,
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * .01,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Order Items",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  AutoSizeText(
                    "${widget.item.orderItems.length} items",
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.item.orderItems
                    .map((e) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: paddingWidth / 6),
                          child: OrderItemWidget(
                            item: e,
                          ),
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Amount",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Item Total",
                    style: TextStyle(
                        color: kMain2Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  AutoSizeText(
                    widget.item.totalPrice + " AED",
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: marginWidth),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       AutoSizeText(
            //         "Discount",
            //         style: TextStyle(
            //             color: kMain2Color,
            //             fontSize: 16,
            //             fontWeight: FontWeight.w500),
            //       ),
            //       AutoSizeText(
            //         widget.item. ?? 0.toString() + " AED",
            //         style: TextStyle(
            //             color: Color(0xff8E44AD),
            //             fontSize: 12,
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: marginWidth),
                child: Divider()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Total",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    widget.item.totalPrice + " AED",
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: marginWidth),
                child: Divider()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "order history",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: paddingHeight,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Day",
                    style: TextStyle(
                        color: kMain2Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  AutoSizeText(
                    date,
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Time",
                    style: TextStyle(
                        color: kMain2Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  AutoSizeText(
                    time,
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Order Number",
                    style: TextStyle(
                        color: kMain2Color,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  AutoSizeText(
                    widget.item.id.toString(),
                    style: TextStyle(
                        color: Color(0xff8E44AD),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
