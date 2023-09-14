import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:ouft/helpers/page_template_center.dart';
import 'package:ouft/providers/cart_provider.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../models/order_get.dart';
import '../../providers/locale_provider.dart';
import '../../screens/main%20screens/home_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../order_screens/order_detail_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int flag = 1;
  List<OrderGetData> orders = [];
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final language = Provider.of<LocaleProvider>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (620 / heightRatio) * height;
    final buttonHeight = (40 / heightRatio) * height;
    final boxHeight = (150 / heightRatio) * height;
    final space = (10 / heightRatio) * height;
    orders = (flag == 1
        ? cart.pendingOrders
        : flag == 2
            ? cart.acceptedOrders
            : cart.cancelledOrders);
    return PageTemplateCenter(
        title: "orders",
        txt: "Order",
        allowScroll: false,
        children: [
          Container(
              height: buttonHeight,
              margin: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = 1;
                      });
                    },
                    child: Container(
                      height: buttonHeight,
                      // width: (100 / widthRatio) * width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            local.coming,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: flag == 1
                                    ? FontWeight.w500
                                    : FontWeight.w500,
                                color: flag == 1
                                    ? Colors.black
                                    : kDisabledTextColor),
                          ),
                          flag == 1
                              ? Container(
                                  color: kMain2Color,
                                  width: (30 / widthRatio) * width,
                                  height: 3,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = 2;
                      });
                    },
                    child: Container(
                      height: buttonHeight,
                      // width: (100 / widthRatio) * width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            local.completed,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: flag == 2
                                    ? FontWeight.w500
                                    : FontWeight.w500,
                                color: flag == 2
                                    ? Colors.black
                                    : kDisabledTextColor),
                          ),
                          flag == 2
                              ? Container(
                                  color: kMain2Color,
                                  width: (30 / widthRatio) * width,
                                  height: 3,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        flag = 3;
                      });
                    },
                    child: Container(
                      height: buttonHeight,
                      // width: (100 / widthRatio) * width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            local.canceled,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: flag == 3
                                    ? FontWeight.w500
                                    : FontWeight.w500,
                                color: flag == 3
                                    ? Colors.black
                                    : kDisabledTextColor),
                          ),
                          flag == 3
                              ? Container(
                                  color: kMain2Color,
                                  width: (30 / widthRatio) * width,
                                  height: 3,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: contentHeight,
            child: orders.isEmpty
                ? Center(
                    child: AutoSizeText("No Orders"),
                  )
                : MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    // removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            bottom: (80 / heightRatio) * height),
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      OrderDetailScreen(
                                    item: orders[index],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: FadedScaleAnimation(
                                Container(
                                  // height: boxHeight,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * .025,
                                      vertical: height * .01),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .025,
                                      vertical: height * .01),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: kCardColor,
                                      border: Border.all(
                                          width: 1.25, color: kWhiteColor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            DateFormat('EE ,dd MMMM yyyy')
                                                .format(orders[index].time),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              wordSpacing: 2,
                                              color: Colors.black,
                                            ),
                                          ),
                                          AutoSizeText(
                                            orders[index].status,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kMainTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: space,
                                      ),
                                      Row(
                                        children: [
                                          AutoSizeText(
                                            '${orders[index].totalPrice} AED',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kPurbleColor,
                                            ),
                                          ),
                                          AutoSizeText(
                                            ' - ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kPurbleColor,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '${orders[index].orderItems.length} items',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: kPurbleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: space,
                                      ),
                                      Row(
                                        children: orders[index]
                                            .orderItems
                                            .map((e) => Container(
                                                margin: EdgeInsets.all(0),
                                                width:
                                                    (50 / widthRatio) * width,
                                                height:
                                                    (50 / widthRatio) * width,
                                                child: Image.network(
                                                    e.product.image)))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ),
                                durationInMilliseconds: 300,
                              ),
                            ),
                          );
                        }),
                  ),
          ),
        ],
        allowBack: true);
  }
}
