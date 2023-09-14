import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/models/cart.dart';
import 'package:ouft/screens/cart_screens/cart_screen.dart';
import 'package:ouft/widgets/product_item_widget.dart';
import 'package:ouft/wrappers/wrapper_auth.dart';
import 'package:provider/provider.dart';
import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../models/home.dart';
import '../../providers/auth_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/data_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dotet_text.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_title.dart';
import '../../widgets/title_row.dart';
import '../../widgets/title_row_black.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';

class ProductScreen extends StatefulWidget {
  final OurProduct item;

  const ProductScreen({super.key, required this.item});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selected = 0;
  bool fav = false;

  List<String> dawa3y = [
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي هذا هو النص ......."
  ];
  List<String> mkwnat = [
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي هذا هو النص .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي هذا هو النص .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي هذا هو النص .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي .......",
    "هذا هو النص الافتراضي هذا هو النص .......",
    "هذا هو النص الافتراضي .......",
  ];
  int currentPage = 0;
  int quantity = 1;
  bool loading = false;

  List<Widget> indicator() => List<Widget>.generate(
      // medicalProducts.length
      1,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 4.0,
            width: currentPage == index ? 30 : 15.0,
            decoration: BoxDecoration(
                color: currentPage == index
                    ? Color(0xff73565A)
                    : const Color(0XFFD2EBE8),
                borderRadius: BorderRadius.circular(0.0)),
          ));
  Widget _customScrollView() {
    final auth = Provider.of<Auth>(context, listen: true);

    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final cart = Provider.of<CartProvider>(context, listen: true);
    bool inCart = cart.cart.any(
      (element) => element.productId == widget.item.id,
    );
    var local = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ListHeight = (480 / heightRatio) * height;
    final itemHeight = (193 / heightRatio) * height;
    final itemWidth = (337 / widthRatio) * width;
    final imgHeight = (286 / heightRatio) * height;
    final imgWidth = (375 / widthRatio) * width;
    final iconHeight = (24 / heightRatio) * height;
    final iconWidth = (24 / widthRatio) * width;
    final txtHeight = (20 / heightRatio) * height;
    final stxtHeight = (12 / heightRatio) * height;
    final txtWidth = (53 / widthRatio) * width;
    final paddingWidth = (16 / widthRatio) * width;
    final marginWidth = (24 / widthRatio) * width;
    final buttonHeight = (44 / heightRatio) * height;
    final buttonWidth = (200 / widthRatio) * width;
    final boxHeight = (60 / heightRatio) * height;
    final boxWidth = (161 / widthRatio) * width;
    final space = (15 / heightRatio) * height;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            elevation: 0,
            expandedHeight: 300.0,
            backgroundColor: kCardBackgroundColor,
            foregroundColor: Colors.white,
            floating: true,
            pinned: true,
            flexibleSpace: Container(
              color: kWhiteColor,
              child: Stack(children: [
                FlexibleSpaceBar(
                  background: SizedBox(
                      child: FancyShimmerImage(
                    imageUrl: widget.item.image,
                    // width: imgWidth,
                    // height: imgHeight,
                    boxFit: BoxFit.fill,
                    errorWidget: Image.network(
                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  )
                      //  Image.network(
                      //     widget.item.image,
                      //     fit: BoxFit.fill,
                      //   ),
                      ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: width,
                    height: iconHeight * 1,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                        color: Colors.white),
                    // margin: EdgeInsets.symmetric(horizontal: paddingWidth),
                  ),
                ),
                // Positioned(
                //   bottom: iconHeight * 1.5,
                //   right: 0,
                //   child: Container(
                //     width: width,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: indicator(),
                //     ),
                //   ),
                // )
              ]),
            )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push<void>(
                        //       context,
                        //       MaterialPageRoute<void>(
                        //         builder: (BuildContext context) =>
                        //             const SalonScreen(),
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     margin:
                        //         EdgeInsets.symmetric(horizontal: marginWidth),
                        //     // color: Colors.red,
                        //     height: txtHeight,
                        //     width: itemWidth,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Image.asset("assets/images/mall2.png"),
                        //         SizedBox(
                        //           width: (10 / widthRatio) * width,
                        //         ),
                        //         const AutoSizeText(
                        //           "Al Barsha Mall",
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w500,
                        //               fontSize: 16),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: space / 2,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: marginWidth),
                          width: (150 / widthRatio) * width,
                          child: AutoSizeText(
                            widget.item.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                            width: (50 / widthRatio) * width,
                            margin:
                                EdgeInsets.symmetric(horizontal: marginWidth),
                            child: Divider(
                              color: kMainColor,
                              height: 2,
                              thickness: 2,
                            )),
                        // SizedBox(
                        //   height: space,
                        // ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: marginWidth, vertical: space / 2),
                            child: Divider(
                              color: Colors.grey,
                            )),

                        Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: marginWidth,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  "${widget.item.finalPrice} AED",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      RoundedButton(
                                          txt: "+",
                                          onTap: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Texttitle(
                                          title: quantity.toString(),
                                        ),
                                      ),
                                      RoundedButton(
                                          txt: "-",
                                          onTap: () {
                                            if (quantity > 1)
                                              setState(() {
                                                quantity--;
                                              });
                                          })
                                    ],
                                  ),
                                )
                              ],
                            )),

                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: marginWidth, vertical: space / 2),
                            child: Divider(
                              color: Colors.grey,
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: marginWidth),
                          child: AutoSizeText(
                            local.description,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: marginWidth),
                          child: Column(
                            children: widget.item.description
                                .split(".")
                                .map(
                                  (e) => DotetText(
                                    title: e,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: marginWidth, vertical: space / 2),
                            child: Divider(
                              color: Colors.grey,
                            )),

                        Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: marginWidth,
                            ),
                            width: itemWidth,
                            child: TitleRowBlack(local.products, null, false)),
                        Container(
                          height: (250 / heightRatio) * height,
                          width: width,
                          // padding: EdgeInsets.only(left: 20, right: 20),
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddingWidth),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: dataProvider.suggestions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(end: 14),
                                  child: FadedScaleAnimation(
                                    ProductItemWidget(
                                      item: dataProvider.suggestions[index],
                                      home: false,
                                    ),
                                    durationInMilliseconds: 300,
                                  ),
                                );
                              }),
                        ),
                        Container(
                          height: (48 / heightRatio) * height,
                          margin: EdgeInsets.symmetric(
                              horizontal: marginWidth, vertical: space / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: (48 / heightRatio) * height,
                                width: (48 / widthRatio) * width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffFFF6F6)),
                                child: IconButton(
                                  icon: Icon(
                                    widget.item.bookmark
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Color(0xffD9A1AA),
                                  ),
                                  onPressed: () async {
                                    if (auth.theUser == null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              WrapperAuth(),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        widget.item.bookmark =
                                            !widget.item.bookmark;
                                      });
                                      final res =
                                          await dataProvider.switchBookmark(
                                              widget.item.id,
                                              auth.theUser!.token);

                                      if (!res) {
                                        setState(() {
                                          widget.item.bookmark =
                                              !widget.item.bookmark;
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (auth.theUser == null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            WrapperAuth(),
                                      ),
                                    );
                                  } else {
                                    if (loading) {
                                      return;
                                    }
                                    if (inCart) {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              CartScreen(),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        loading = true;
                                      });
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return LoadingAlert();
                                          });

                                      final res = await cart
                                          .addCartItem(
                                              widget.item.id.toString(),
                                              quantity.toString(),
                                              auth.theUser!.token)
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
                                                msg: "can't add item",
                                                action1: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: AutoSizeText(
                                                    "ok",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: kMainTextColor,
                                                    ),
                                                  ),
                                                ),
                                                action2: null,
                                              );
                                            });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          dismissDirection: DismissDirection.up,
                                          action: SnackBarAction(
                                            label: local.cart,
                                            textColor: Colors.black,
                                            // textColor: Colors.black,
                                            onPressed: () {
                                              Navigator.push<void>(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          CartScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                          content: Text(
                                            "item added to the cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          backgroundColor: kMain3Color,
                                          margin: EdgeInsets.only(
                                              bottom: height - (iconHeight * 5),
                                              right: 20,
                                              left: 20),
                                        ));
                                      }

                                      setState(() {
                                        loading = false;
                                        inCart = true;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  // padding: EdgeInsets.symmetric(
                                  //     vertical: (12 / heightRatio) * height),
                                  width: (241 / widthRatio) * width,
                                  height: (48 / heightRatio) * height,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: kMainColor),
                                  child: loading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            inCart
                                                ? Icon(
                                                    Icons.check,
                                                    color: kWhiteColor,
                                                  )
                                                : SvgPicture.asset(
                                                    "assets/images/shopping-cart.svg",
                                                    color: kWhiteColor,
                                                  ),
                                            SizedBox(
                                              width: (12 / widthRatio) * width,
                                            ),
                                            AutoSizeText(
                                              inCart
                                                  ? "Added to cart"
                                                  : "Add to cart",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: space * 6,
                        ),
                      ],
                    ),
                  ),
              childCount: 1),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customScrollView(),
    );
  }
}
  

  // return Scaffold(
  //   backgroundColor: kCardBackgroundColor,
  //   appBar: AppBar(
  //     elevation: 0,
  //     backgroundColor: Colors.transparent,
  //     systemOverlayStyle:
  //         SystemUiOverlayStyle.dark, // or use SystemUiOverlayStyle.light
  //     iconTheme: IconThemeData(color: kBackIconColor),

  //     actions: [
  //       Container(
  //         width: iconHeight,
  //         height: iconHeight,
  //         alignment: Alignment.center,
  //         margin: EdgeInsets.symmetric(horizontal: paddingWidth),
  //         child: FittedBox(
  //           fit: BoxFit.fitWidth,
  //           child: Container(
  //             alignment: Alignment.center,
  //             padding: EdgeInsets.all(3),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(iconWidth),
  //               color: Colors.white,
  //             ),
  //             child: const Icon(
  //               true ? Icons.favorite : Icons.favorite_border,
  //               color: Colors.red,
  //               size: 16,
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   ),
  //   body: Center(
  //     child: SizedBox(
  //       height: height,
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Container(
  //               // color: Colors.red,
  //               height: imgHeight,
  //               width: imgWidth,
  //               child: Image.asset(
  //                 "assets/images/order.png",
  //                 height: imgHeight,
  //                 width: imgWidth,
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //             Container(
  //               // color: Colors.red,
  //               height: txtHeight,
  //               width: itemWidth,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const AutoSizeText(
  //                     "جهــــاز ضغــط الـــــدم",
  //                     style: TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 16),
  //                   ),
  //                   AutoSizeText(
  //                     "50 ر.ق",
  //                     style: TextStyle(
  //                         color: kMainColor,
  //                         fontWeight: FontWeight.w700,
  //                         fontSize: 16),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: ListHeight,
  //               width: itemWidth,
  //               child: ListView(
  //                 children: [
  //                   Container(
  //                       height: buttonHeight,
  //                       width: width,
  //                       padding: EdgeInsets.symmetric(
  //                           horizontal: width * .00, vertical: 4),
  //                       margin: EdgeInsets.symmetric(vertical: height * .02),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(12),
  //                         color: kSwitchColor,
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 // flag = 2;
  //                                 selected = 0;
  //                               });
  //                             },
  //                             child: Container(
  //                               height: buttonHeight,
  //                               width: (itemWidth / 2) - 4,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(12),
  //                                 color: selected == 0
  //                                     ? kWhiteColor
  //                                     : Colors.transparent,
  //                               ),
  //                               child: Center(
  //                                 child: Text(
  //                                   'الوصـــف',
  //                                   style: TextStyle(
  //                                       fontSize: 16,
  //                                       fontWeight: selected == 0
  //                                           ? FontWeight.w700
  //                                           : FontWeight.w400,
  //                                       color: selected == 0
  //                                           ? kMainColor
  //                                           : Colors.black),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           InkWell(
  //                             onTap: () {
  //                               setState(() {
  //                                 // flag = 2;
  //                                 selected = 1;
  //                               });
  //                             },
  //                             child: Container(
  //                               height: buttonHeight,
  //                               width: (itemWidth / 2) - 4,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(12),
  //                                 color: selected == 1
  //                                     ? kWhiteColor
  //                                     : Colors.transparent,
  //                               ),
  //                               child: Center(
  //                                 child: Text(
  //                                   'المكـــونــات',
  //                                   style: TextStyle(
  //                                       fontSize: 16,
  //                                       fontWeight: selected == 1
  //                                           ? FontWeight.w700
  //                                           : FontWeight.w400,
  //                                       color: selected == 1
  //                                           ? kMainColor
  //                                           : Colors.black),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       )),
  //                   Container(
  //                     child: selected == 0
  //                         ? Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 "هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص",
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     fontWeight: FontWeight.w400,
  //                                     color: ksecondTextColor),
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                               Text(
  //                                 "دواعي الاستعمال",
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     fontWeight: FontWeight.w700,
  //                                     color: kMainColor),
  //                               ),
  //                               Column(
  //                                 children: dawa3y
  //                                     .map(
  //                                       (e) => DotetText(
  //                                         title: e,
  //                                       ),
  //                                     )
  //                                     .toList(),
  //                               ),
  //                             ],
  //                           )
  //                         : Column(
  //                             children: mkwnat
  //                                 .map(
  //                                   (e) => DotetText(
  //                                     title: e,
  //                                   ),
  //                                 )
  //                                 .toList(),
  //                           ),
  //                   ),
  //                   SizedBox(
  //                     height: space,
  //                   ),
  //                   Container(
  //                     width: itemWidth,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           children: [
  //                             Container(
  //                                 decoration: BoxDecoration(
  //                                   gradient: const LinearGradient(
  //                                     begin: Alignment.topCenter,
  //                                     end: Alignment.bottomCenter,
  //                                     colors: <Color>[
  //                                       Color(0xff5ECBE7),
  //                                       Color(0xff50A1D1)
  //                                     ],
  //                                   ),
  //                                   borderRadius:
  //                                       BorderRadius.all(Radius.circular(55)),
  //                                 ),
  //                                 // color: Colors.red,
  //                                 width: buttonWidth,
  //                                 height: buttonHeight,
  //                                 child: CustomButton(
  //                                     txt: "إضافة إلى العربة", onTap: () {})),
  //                           ],
  //                         ),
  //                         SizedBox(
  //                           child: Row(
  //                             children: [
  //                               RoundedButton(txt: "+", onTap: () {}),
  //                               Padding(
  //                                 padding: const EdgeInsets.symmetric(
  //                                     horizontal: 8.0),
  //                                 child: Texttitle(
  //                                   title: "2",
  //                                 ),
  //                               ),
  //                               RoundedButton(txt: "-", onTap: () {})
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: space,
  //                   ),
  //                   TitleRow("الأدوية المشابهة", () {}, true),
  //                   Container(
  //                     height: (193 / heightRatio) * height,
  //                     width: width,
  //                     // padding: EdgeInsets.only(left: 20, right: 20),
  //                     child: ListView.builder(
  //                         shrinkWrap: true,
  //                         padding:
  //                             EdgeInsets.symmetric(horizontal: paddingWidth),
  //                         physics: BouncingScrollPhysics(),
  //                         scrollDirection: Axis.horizontal,
  //                         itemCount: medicalProducts.length,
  //                         itemBuilder: (context, index) {
  //                           return Padding(
  //                             padding: EdgeInsetsDirectional.only(end: 14),
  //                             child: FadedScaleAnimation(
  //                               ProductItem(
  //                                 product: medicalProducts[index],
  //                               ),
  //                               durationInMilliseconds: 300,
  //                             ),
  //                           );
  //                         }),
  //                   ),
  //                   SizedBox(
  //                     height: space,
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ]),
  //     ),
  //   ),
  // );

// @override
// Widget build(BuildContext context) {
//   final height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
//   final ListHeight = (480 / heightRatio) * height;
//   final itemHeight = (193 / heightRatio) * height;
//   final itemWidth = (343 / widthRatio) * width;
//   final imgHeight = (180 / heightRatio) * height;
//   final imgWidth = (145 / widthRatio) * width;
//   final iconHeight = (24 / heightRatio) * height;
//   final iconWidth = (24 / widthRatio) * width;
//   final txtHeight = (30 / heightRatio) * height;
//   final stxtHeight = (12 / heightRatio) * height;
//   final txtWidth = (48 / widthRatio) * width;
//   final paddingWidth = (16 / widthRatio) * width;
//   final buttonHeight = (44 / heightRatio) * height;
//   final buttonWidth = (200 / widthRatio) * width;
//   final space = (15 / heightRatio) * height;

//   return Scaffold(
//     backgroundColor: kCardBackgroundColor,
//     appBar: AppBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       systemOverlayStyle:
//           SystemUiOverlayStyle.dark, // or use SystemUiOverlayStyle.light
//       iconTheme: IconThemeData(color: kBackIconColor),

      // actions: [
      //   Container(
      //     width: iconHeight,
      //     height: iconHeight,
      //     alignment: Alignment.center,
      //     margin: EdgeInsets.symmetric(horizontal: paddingWidth),
      //     child: FittedBox(
      //       fit: BoxFit.fitWidth,
      //       child: Container(
      //         alignment: Alignment.center,
      //         padding: EdgeInsets.all(3),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(iconWidth),
      //           color: Colors.white,
      //         ),
      //         child: const Icon(
      //           true ? Icons.favorite : Icons.favorite_border,
      //           color: Colors.red,
      //           size: 16,
      //         ),
      //       ),
      //     ),
      //   )
      // ],
//     ),
//     body: Center(
//       child: SizedBox(
//         height: height,
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 // color: Colors.red,
//                 height: imgHeight,
//                 width: imgWidth,
//                 child: Image.asset(
//                   "assets/images/order.png",
//                   height: imgHeight,
//                   width: imgWidth,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Container(
//                 // color: Colors.red,
//                 height: txtHeight,
//                 width: itemWidth,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const AutoSizeText(
//                       "جهــــاز ضغــط الـــــدم",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                     AutoSizeText(
//                       "50 ر.ق",
//                       style: TextStyle(
//                           color: kMainColor,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: ListHeight,
//                 width: itemWidth,
//                 child: ListView(
//                   children: [
//                     Container(
//                         height: buttonHeight,
//                         width: width,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: width * .00, vertical: 4),
//                         margin: EdgeInsets.symmetric(vertical: height * .02),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: kSwitchColor,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // flag = 2;
//                                   selected = 0;
//                                 });
//                               },
//                               child: Container(
//                                 height: buttonHeight,
//                                 width: (itemWidth / 2) - 4,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: selected == 0
//                                       ? kWhiteColor
//                                       : Colors.transparent,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'الوصـــف',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: selected == 0
//                                             ? FontWeight.w700
//                                             : FontWeight.w400,
//                                         color: selected == 0
//                                             ? kMainColor
//                                             : Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   // flag = 2;
//                                   selected = 1;
//                                 });
//                               },
//                               child: Container(
//                                 height: buttonHeight,
//                                 width: (itemWidth / 2) - 4,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: selected == 1
//                                       ? kWhiteColor
//                                       : Colors.transparent,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'المكـــونــات',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: selected == 1
//                                             ? FontWeight.w700
//                                             : FontWeight.w400,
//                                         color: selected == 1
//                                             ? kMainColor
//                                             : Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                     Container(
//                       child: selected == 0
//                           ? Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص هذا هو النص الافتراضي هذا هو النص",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       color: ksecondTextColor),
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 Text(
//                                   "دواعي الاستعمال",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w700,
//                                       color: kMainColor),
//                                 ),
//                                 Column(
//                                   children: dawa3y
//                                       .map(
//                                         (e) => DotetText(
//                                           title: e,
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ],
//                             )
//                           : Column(
//                               children: mkwnat
//                                   .map(
//                                     (e) => DotetText(
//                                       title: e,
//                                     ),
//                                   )
//                                   .toList(),
//                             ),
//                     ),
//                     SizedBox(
//                       height: space,
//                     ),
//                     Container(
//                       width: itemWidth,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                     gradient: const LinearGradient(
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//                                       colors: <Color>[
//                                         Color(0xff5ECBE7),
//                                         Color(0xff50A1D1)
//                                       ],
//                                     ),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(55)),
//                                   ),
//                                   // color: Colors.red,
//                                   width: buttonWidth,
//                                   height: buttonHeight,
//                                   child: CustomButton(
//                                       txt: "إضافة إلى العربة", onTap: () {})),
//                             ],
//                           ),
//                           SizedBox(
//                             child: Row(
//                               children: [
//                                 RoundedButton(txt: "+", onTap: () {}),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 8.0),
//                                   child: Texttitle(
//                                     title: "2",
//                                   ),
//                                 ),
//                                 RoundedButton(txt: "-", onTap: () {})
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: space,
//                     ),
//                     TitleRow("الأدوية المشابهة", () {}, true),
//                     Container(
//                       height: (193 / heightRatio) * height,
//                       width: width,
//                       // padding: EdgeInsets.only(left: 20, right: 20),
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           padding:
//                               EdgeInsets.symmetric(horizontal: paddingWidth),
//                           physics: BouncingScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           itemCount: medicalProducts.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: EdgeInsetsDirectional.only(end: 14),
//                               child: FadedScaleAnimation(
//                                 ProductItem(
//                                   product: medicalProducts[index],
//                                 ),
//                                 durationInMilliseconds: 300,
//                               ),
//                             );
//                           }),
//                     ),
//                     SizedBox(
//                       height: space,
//                     ),
//                   ],
//                 ),
//               )
//             ]),
//       ),
//     ),
//   );
// }


// }
