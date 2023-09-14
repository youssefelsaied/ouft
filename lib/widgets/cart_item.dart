import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../alarts/custom_alart.dart';
import '../alarts/loading_alart.dart';
import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

import '../models/cart.dart';
import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/data_provider.dart';
import 'rounded_button.dart';
import 'text_title.dart';

class CartItem extends StatefulWidget {
  final CartItemData item;
  const CartItem({
    super.key,
    required this.item,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quanntity = 1;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: true);
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (620 / heightRatio) * height;
    final buttonHeight = (56 / heightRatio) * height;
    final paddingHeight = (4 / heightRatio) * height;
    final boxWidth = (210 / widthRatio) * width;
    final bigBoxWidth = (136 / widthRatio) * width;
    final smallBoxWidth = (74 / widthRatio) * width;
    final boxPadding = (5 / widthRatio) * width;
    final imgPadding = (10 / widthRatio) * width;
    final imgWidth = (72 / widthRatio) * width;
    final imgHeight = (84 / heightRatio) * height;
    final txtHeight = (24 / heightRatio) * height;

    final contentWidth = (337 / widthRatio) * width;
    final itemHeight = (106 / heightRatio) * height;
    final itemWidth = contentWidth / 3.1;
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      // onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlert(
                title: "Delete  ${widget.item.product.name}",
                msg: "are you sure to delete this item",
                action1: InkWell(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return LoadingAlert();
                        });
                    await cartProvider
                        .removeCartItem(widget.item, auth.theUser!.token)
                        .catchError((e) {
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                    });
                    Navigator.of(context).pop(true);
                    Navigator.of(context).pop(true);
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
                action2: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: AutoSizeText(
                    "No",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kMainTextColor,
                    ),
                  ),
                ),
              );
            });
      },
      key: ValueKey(widget.item),
      background: Container(
        // most importantly, do not forget to give the inner container a
        // padding to the right so that our icon does not stick to the
        // wall of the container when swiping

        padding: const EdgeInsets.only(
          right: 16,
        ),
        color: Colors.white,
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffF7F7F9),
          ),
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(
            "assets/images/trash.svg",
            color: Colors.red,
          ),
        ),
      ),

      child: Container(
        // height: itemHeight,
        padding: EdgeInsets.symmetric(vertical: paddingHeight * 3),
        margin: EdgeInsets.symmetric(vertical: paddingHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffF7F7F9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: imgPadding),
                // color: Colors.red,
                height: imgHeight,
                width: imgWidth,
                child: FancyShimmerImage(
                  imageUrl: widget.item.product.image,
                  width: imgWidth,
                  height: imgHeight,
                  boxFit: BoxFit.fill,
                  errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                )),
            Container(
              width: bigBoxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    child: AutoSizeText(
                      widget.item.product.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: kMainTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    // height: txtHeight,
                    child: Text(
                      widget.item.product.description,
                      style: TextStyle(
                          fontSize: 10,
                          color: kMain2Color,
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: paddingHeight * 2.5,
                  ),
                  SizedBox(
                    child: Text(
                      "${widget.item.product.finalPrice} AED",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff8E44AD),
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: smallBoxWidth,
              child: Row(
                children: [
                  SizedBox(
                      width: (22 / widthRatio) * width,
                      child: RoundedButton(
                          txt: "+",
                          onTap: () async {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return LoadingAlert();
                                });

                            final res = await cartProvider.addQuantity(
                                widget.item, auth.theUser!.token);
                            Navigator.pop(context);
                            if (!res) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlert(
                                      title: "Error",
                                      msg: "can't add item quantity",
                                      action1: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: AutoSizeText(
                                          "ok",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: kMainTextColor,
                                          ),
                                        ),
                                      ),
                                      action2: null,
                                    );
                                  });
                            }
                          })),
                  Container(
                    alignment: Alignment.center,
                    width: (27 / widthRatio) * width,
                    child: AutoSizeText(
                      widget.item.quantity.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: (22 / widthRatio) * width,
                    child: RoundedButton(
                      txt: "-",
                      txtColor: Color(0xff828A89),
                      onTap: () async {
                        if (double.parse(widget.item.quantity.toString())
                                .toInt() <=
                            1) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlert(
                                  title: "Delete ${widget.item.product.name}",
                                  msg: "are you sure to delete this item",
                                  action1: InkWell(
                                    onTap: () async {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LoadingAlert();
                                          });
                                      await cartProvider
                                          .removeCartItem(
                                              widget.item, auth.theUser!.token)
                                          .catchError((e) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      });
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
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
                                  action2: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: AutoSizeText(
                                      "No",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: kMainTextColor,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return LoadingAlert();
                              });

                          final res = await cartProvider
                              .minQuantity(widget.item, auth.theUser!.token)
                              .catchError((e) {
                            Navigator.pop(context);
                          });
                          Navigator.pop(context);

                          if (!res) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomAlert(
                                    title: "Error",
                                    msg: "can't add item quantity",
                                    action1: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: AutoSizeText(
                                        "ok",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: kMainTextColor,
                                        ),
                                      ),
                                    ),
                                    action2: null,
                                  );
                                });
                          }
                        }
                      },
                      color: Color(0xffF0F0F2),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

// Dismissible(
    // // key: ValueKey(widget.item),
    // // key: dataProvider.about,
    // background: Container(
    //   // most importantly, do not forget to give the inner container a
    //   // padding to the right so that our icon does not stick to the
    //   // wall of the container when swiping

    //   padding: const EdgeInsets.only(
    //     right: 16,
    //   ),
    //   color: Colors.white,
    //   alignment: Alignment.centerRight,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(50),
    //       color: Color(0xffF7F7F9),
    //     ),
    //     padding: EdgeInsets.all(15),
    //     child: SvgPicture.asset(
    //       "assets/images/trash.svg",
    //       color: Colors.red,
    //     ),
    //   ),
    // ),
//       child: Container(
//         // height: itemHeight,
//         padding: EdgeInsets.symmetric(vertical: paddingHeight * 3),
//         margin: EdgeInsets.symmetric(vertical: paddingHeight),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Color(0xffF7F7F9),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: imgPadding),
//               // color: Colors.red,
//               height: imgHeight,
//               width: imgWidth,
//               child: Image.asset(
//                 widget.item.image,
//                 fit: BoxFit.fill,
//                 scale: 1,
//                 height: imgHeight,
//                 width: imgWidth,
//               ),
//             ),
//             Container(
//               width: bigBoxWidth,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   SizedBox(
//                     child: AutoSizeText(
//                       "Skin Care Creem",
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: kMainTextColor,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   SizedBox(
//                     height: txtHeight,
//                     child: Text(
//                       "Al Barsha Mall",
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: kMain2Color,
//                           fontWeight: FontWeight.w400),
//                       maxLines: 4,
//                     ),
//                   ),
//                   SizedBox(
//                     height: paddingHeight * 2.5,
//                   ),
//                   SizedBox(
//                     child: Text(
//                       "279.95 AED",
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xff8E44AD),
//                           fontWeight: FontWeight.w500),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: smallBoxWidth,
//               child: Row(
//                 children: [
//                   SizedBox(
//                       width: (22 / widthRatio) * width,
//                       child: RoundedButton(
//                           txt: "+",
//                           onTap: () {
//                             setState(() {
//                               quanntity++;
//                             });
//                           })),
//                   Container(
//                     alignment: Alignment.center,
//                     width: (27 / widthRatio) * width,
//                     child: AutoSizeText(
//                       quanntity.toString(),
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(
//                     width: (22 / widthRatio) * width,
//                     child: RoundedButton(
//                       txt: "-",
//                       txtColor: Color(0xff828A89),
//                       onTap: () {
//                         setState(() {
//                           quanntity--;
//                         });
//                       },
//                       color: Color(0xffF0F0F2),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
  }
}
