import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/screens/cart_screens/cart_checkout_screen.dart';
import 'package:provider/provider.dart';
import '../../helpers/colors.dart';
import '../../providers/cart_provider.dart';
import '../../screens/cart_screens/order_confirm_screen.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/item_row.dart';

import '../../helpers/dimintions.dart';
import '../main screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatefulWidget {
  bool home;
  CartScreen({super.key, this.home = false});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final topNotch = MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context, listen: true);

    var local = AppLocalizations.of(context)!;

    final space = (20 / heightRatio) * height;
    final contentHeight = (650 / heightRatio) * height;
    final contentWidth = (337 / widthRatio) * width;
    final paddingWidth = (10 / widthRatio) * width;
    final itemHeight = (193 / heightRatio) * height;
    final itemWidth = (164 / widthRatio) * width;
    final itemsHeight = (382 / heightRatio) * height;
    final itemsWidth = (337 / widthRatio) * width;
    final coubnHeight = (48 / heightRatio) * height;
    final paddingHeight = (16 / heightRatio) * height;
    final coubnWidth = (341 / widthRatio) * width;
    final boxHeight = (253 / heightRatio) * height;
    final boxWidth = (337 / widthRatio) * width;
    final buttonHeight = (48 / heightRatio) * height;
    final buttonWidth = (200 / widthRatio) * width;

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: topNotch,
              ),
              // Texttitle(title: local.account),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (20 / widthRatio) * width,
                      child: widget.home
                          ? Container()
                          : InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios),
                            ),
                    ),
                    AutoSizeText(
                      "Shopping",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: (20 / widthRatio) * width,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: contentHeight,
            width: width,
            child: cart.cart.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(paddingWidth),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/shopping-cart.svg",
                            width: (160 / widthRatio) * width,
                            height: (160 / heightRatio) * height,
                            color: kMain2Color,
                          ),
                          AutoSizeText(
                            "It looks like you have not added anything to your cart yet ! start shopping and add products .",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        // SizedBox(
                        //   height: paddingHeight,
                        // ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: kCardBackgroundColor,
                          ),
                          height: itemsHeight,
                          width: itemsWidth,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: cart.cart
                                  .map((e) => CartItem(item: e))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: paddingHeight * 1,
                        ),
                        Container(
                          // height: boxHeight,
                          width: boxWidth,
                          // padding: EdgeInsets.symmetric(horizontal: paddingWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Divider(),
                              Text(
                                "Order Summary",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              ItemRow(local.subtotal,
                                  "${cart.calculateSubTotal()} AED"),
                              Divider(),
                              ItemRow(
                                  "shipping cost", "${cart.shippingCost} AED"),
                              Divider(),
                              ItemRow(
                                  local.total, "${cart.calculateTotal()} AED"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: paddingHeight * 1,
                        ),
                        SizedBox(
                            width: boxWidth,
                            height: buttonHeight,
                            child: CustomButton(
                                txt: "الذهــاب لعمليــة الــدفع",
                                onTap: () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const CartCheckoutScreen(),
                                    ),
                                  );
                                })),
                        // SizedBox(
                        //   height: paddingHeight,
                        // ),
                      ],
                    ),
                  ),
          ),
        ],
      )),
    );

    // PageTemplate(
    //     color: kCardBackgroundColor,
    //     title: local.cart,
    //     txt: "جميع المنتجات التى تمت اضافتها الى عربة التسوق",
    //     allowBack: false,
    //     children: [
    //       SizedBox(
    //         height: paddingHeight,
    //       ),
    //       Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //           // color: kCardBackgroundColor,
    //         ),
    //         // height: itemsHeight,
    //         width: itemsWidth,
    //         child: Column(
    //           children: drugs.map((e) => CartItem(item: e)).toList(),
    //         ),
    //       ),
    //       SizedBox(
    //         height: paddingHeight,
    //       ),
    //       Container(
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(9),
    //             // color: kWhiteColor,
    //             border: Border.all(color: kMain2Color, width: 1)),
    //         height: coubnHeight,
    //         width: coubnWidth,
    //         child: Row(
    //           children: [
    //             Container(
    //               width: (55 / widthRatio) * width,
    //               height: coubnHeight,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(8),
    //                 color: kMain2Color,
    //               ),
    //               child: SvgPicture.asset(
    //                 "assets/images/wallet.svg",
    //                 fit: BoxFit.scaleDown,
    //               ),
    //             ),
    //             Container(
    //               width: ((341 - 57) / widthRatio) * width,
    //               height: coubnHeight,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 // color: kMain2Color,
    //               ),
    //               child: EntryField(
    //                 hint: local.promo_code,
    //                 allowHeight: true,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: paddingHeight * 1,
    //       ),
    //       Container(
    //         // height: boxHeight,
    //         width: boxWidth,
    //         padding: EdgeInsets.symmetric(horizontal: paddingWidth),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             const Text(
    //               "------------------------------------------------------------------------------------------------------------------------------------------------",
    //               maxLines: 1,
    //             ),
    //             ItemRow(local.subtotal, "ر.ق 75"),
    //             const Text(
    //               "------------------------------------------------------------------------------------------------------------------------------------------------",
    //               maxLines: 1,
    //             ),
    //             ItemRow(local.discount, "ر.ق 15"),
    //             const Text(
    //               "------------------------------------------------------------------------------------------------------------------------------------------------",
    //               maxLines: 1,
    //             ),
    //             ItemRow(local.total, "ر.ق 50"),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: paddingHeight * 1,
    //       ),
    //       SizedBox(
    //           width: boxWidth,
    //           height: buttonHeight,
    //           child: CustomButton(
    //               txt: "الذهــاب لعمليــة الــدفع",
    //               onTap: () {
    //                 Navigator.push<void>(
    //                   context,
    //                   MaterialPageRoute<void>(
    //                     builder: (BuildContext context) =>
    //                         const OrderConfirmScreen(),
    //                   ),
    //                 );
    //               })),
    //       SizedBox(
    //         height: paddingHeight,
    //       ),
    //     ]);

    // Scaffold(
    //     backgroundColor: kCardBackgroundColor,
    //     appBar: AppBar(
    //       systemOverlayStyle:
    //           SystemUiOverlayStyle.dark, // or use SystemUiOverlayStyle.light

    //       title: Texttitle(title: local.cart),
    //       iconTheme: IconThemeData(color: kBackIconColor),
    //       elevation: 0,
    //       backgroundColor: Colors.transparent,
    //     ),
    //     body: SingleChildScrollView(
    //       child: Center(
    //         child: Column(
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 color: kWhiteColor,
    //               ),
    //               height: itemsHeight,
    //               width: itemsWidth,
    //               child: ListView.builder(
    //                 itemCount: drugs.length,
    //                 itemBuilder: ((context, index) {
    //                   return Column(
    //                     children: [
    //                       CartItem(item: drugs[index]),
    //                       const Padding(
    //                         padding: EdgeInsets.all(7.0),
    //                         child: Divider(
    //                           height: 2,
    //                           color: Color(0xffD9D9D9),
    //                         ),
    //                       )
    //                     ],
    //                   );
    //                 }),
    //               ),
    //             ),
    //             SizedBox(
    //               height: paddingHeight,
    //             ),
    //             Container(
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(9),
    //                   color: kWhiteColor,
    //                   border: Border.all(color: kMain2Color, width: 1)),
    //               height: coubnHeight,
    //               width: coubnWidth,
    //               child: Row(
    //                 children: [
    //                   Container(
    //                     width: (55 / widthRatio) * width,
    //                     height: coubnHeight,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(8),
    //                       color: kMain2Color,
    //                     ),
    //                     child: SvgPicture.asset(
    //                       "assets/images/wallet.svg",
    //                       fit: BoxFit.scaleDown,
    //                     ),
    //                   ),
    //                   Container(
    //                     width: ((341 - 57) / widthRatio) * width,
    //                     height: coubnHeight,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(12),
    //                       // color: kMain2Color,
    //                     ),
    //                     child: EntryField(
    //                       hint: local.promo_code,
    //                       allowHeight: true,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: paddingHeight * 1,
    //             ),
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 color: kWhiteColor,
    //               ),
    //               height: boxHeight,
    //               width: boxWidth,
    //               padding: EdgeInsets.symmetric(horizontal: paddingWidth),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   ItemRow(local.subtotal, "ر.ق 75"),
    //                   ItemRow(local.discount, "ر.ق 15"),
    //                   ItemRow(local.total, "ر.ق 50"),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: paddingHeight * 4,
    //             ),
    //             SizedBox(
    //                 width: boxWidth,
    //                 height: buttonHeight,
    //                 child: CustomButton(
    //                     txt: "الذهــاب لعمليــة الــدفع",
    //                     onTap: () {
    //                       Navigator.push<void>(
    //                         context,
    //                         MaterialPageRoute<void>(
    //                           builder: (BuildContext context) =>
    //                               const OrderConfirmScreen(),
    //                         ),
    //                       );
    //                     }))
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
