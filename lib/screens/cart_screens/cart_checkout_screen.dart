import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ouft/providers/auth_provider.dart';
import 'package:ouft/providers/data_provider.dart';
import 'package:ouft/widgets/address_item.dart';
import 'package:provider/provider.dart';

import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../alarts/order_sucess_alart.dart';
import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/item_row.dart';
import '../../widgets/service_widget.dart';
import '../../widgets/text_title.dart';
import '../address_screens/add_address_screen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CartCheckoutScreen extends StatefulWidget {
  const CartCheckoutScreen({super.key});

  @override
  State<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final cart = Provider.of<CartProvider>(context, listen: true);
    final data = Provider.of<DataProvider>(context, listen: true);
    final auth = Provider.of<Auth>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = (20 / heightRatio) * height;
    final contentHeight = (650 / heightRatio) * height;
    final contentWidth = (72 / widthRatio) * width;
    final paddingWidth = (20 / widthRatio) * width;
    final imgHeight = (56 / heightRatio) * height;
    final bottonHeight = (48 / heightRatio) * height;
    final imgWidth = (73 / widthRatio) * width;

    final txtHeight = (42 / heightRatio) * height;
    final marginWidth = (24 / widthRatio) * width;
    final topNotch = MediaQuery.of(context).padding.top;
    final bottomNotch = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: topNotch == 0 ? space : topNotch,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: (31 / widthRatio) * width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (24 / widthRatio) * width,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                          )),
                    ),
                    AutoSizeText(
                      "Checkout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: (24 / widthRatio) * width,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: space,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: space,
                      // ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: marginWidth),
                        // color: Colors.red,
                        height: txtHeight,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "Payment Method",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: space / 2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: marginWidth),
                        padding: EdgeInsets.symmetric(
                            horizontal: marginWidth, vertical: space),
                        decoration: BoxDecoration(
                          color: kCardBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: kMain2Color)),
                              child: Icon(
                                Icons.circle,
                                color: kMain2Color,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: space,
                            ),
                            const AutoSizeText(
                              "Cash Payment",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: marginWidth),
                        // color: Colors.red,
                        height: txtHeight,
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AutoSizeText(
                              "Shipping To",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const AddAddressScreen(),
                                  ),
                                );
                              },
                              child: AutoSizeText(
                                "Add Address",
                                style: TextStyle(
                                    color: kMain4Color,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: space / 2,
                      ),
                      Column(
                        children: data.userAddresses
                            .map((e) => AddressItem(address: e))
                            .toList(),
                      ),
                      SizedBox(
                        height: space / 2,
                      ),
                      SizedBox(
                        height: space * 13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: marginWidth),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              width: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: space / 2,
                    ),
                    Text(
                      "Amount",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: space,
                    ),
                    ItemRow(local.subtotal, "${cart.calculateSubTotal()} AED"),
                    Divider(),
                    ItemRow("shipping cost", "${cart.shippingCost} AED"),
                    Divider(),
                    ItemRow(local.total, "${cart.calculateTotal()} AED"),
                    SizedBox(
                      height: space,
                    ),
                    SizedBox(
                        height: bottonHeight,
                        child: CustomButton(
                            txt: "Place Order",
                            onTap: () async {
                              if (data.selectedAddress == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Please select address",
                                          textAlign: TextAlign.center,
                                        )));
                              } else {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return LoadingAlert();
                                    });
                                final res = await cart
                                    .makeOrder(auth.theUser!.token,
                                        data.selectedAddress!.id)
                                    .catchError((e) {
                                  Navigator.pop(context);

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomAlert(
                                            title: "Error Occured",
                                            msg:
                                                "something went wrong please try again later !",
                                            action1: InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                              },
                                              child: AutoSizeText(
                                                "Ok",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: kMainColor,
                                                ),
                                              ),
                                            ),
                                            action2: null);
                                      });
                                });
                                Navigator.pop(context);

                                if (res.error) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomAlert(
                                            title: "Error Occured",
                                            msg:
                                                "something went wrong please try again later !",
                                            action1: InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                              },
                                              child: AutoSizeText(
                                                "Ok",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: kMainColor,
                                                ),
                                              ),
                                            ),
                                            action2: null);
                                      });
                                } else {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return OrderSuccessAlert(orderId: "1");
                                      });
                                }
                              }
                            })),
                    SizedBox(
                      height: space,
                    )
                  ]),
            ),
          )
        ],
      )),
    );
  }
}
