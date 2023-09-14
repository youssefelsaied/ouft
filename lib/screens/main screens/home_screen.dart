import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/screens/product_screen/product_screen.dart';
import 'package:ouft/screens/product_screen/products_screen.dart';
import 'package:ouft/screens/suggestions_screens/suggestions_screen.dart';
import 'package:ouft/widgets/custom_button.dart';
import 'package:ouft/widgets/product_item_widget.dart';
import 'package:ouft/widgets/text_title.dart';
import '../../helpers/colors.dart';
import '../../providers/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/dimintions.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/title_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context, listen: true);
    final dataProvider = Provider.of<DataProvider>(context, listen: true);

    final space = (20 / heightRatio) * height;
    final contentHeight = (497 / heightRatio) * height;
    final contentWidth = (335 / widthRatio) * width;
    final barHeight = (48 / heightRatio) * height;
    final barWidth = (342 / widthRatio) * width;
    final searchBarHeight = (40 / heightRatio) * height;
    final searchBarWidth = (310 / widthRatio) * width;
    final space2 = (20 / heightRatio) * height;

    final rightBarWidth = (145 / widthRatio) * width;
    final imgHeight = (40 / heightRatio) * height;
    final imgWidth = (40 / widthRatio) * width;
    final helloHeight = (28 / heightRatio) * height;
    final helloWidth = (87 / widthRatio) * width;
    final morningHeight = (20 / heightRatio) * height;
    final morningWidth = (80 / widthRatio) * width;

    final offerHeight = (200 / heightRatio) * height;
    final offerWidth = (350 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;
    final paddingWidth = ((widthRatio - 341) / widthRatio) * width / 2;
    // var search_here;
    List<Widget> indicator() => List<Widget>.generate(
        dataProvider.slider.length,
        (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  color: currentPage == index
                      ? kMainColor
                      : const Color(0XFF256075).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0)),
            ));

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kCardBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: space,
                    ),
                    SizedBox(
                      // height: barHeight,
                      width: barWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: AutoSizeText(
                            "${local.welcome_back} , ${auth.theUser == null ? "guest" : auth.theUser!.name}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              // wordSpacing: 5,
                            ),
                          )),
                          SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: imgWidth,
                            height: imgWidth,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: space,
                    ),
                    SizedBox(
                      height: space * .7,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        enableInfiniteScroll: true,
                        // height: offerHeight,
                        autoPlay: true,
                        aspectRatio: 327 / 170,
                        enlargeCenterPage: true,
                        viewportFraction: 0.99,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: dataProvider.slider
                          .map(
                            (item) => Container(
                              height: offerHeight,
                              width: width * 2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: (width - barWidth) / 2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: FancyShimmerImage(
                                    imageUrl: item.image,
                                    width: imgWidth,
                                    height: imgHeight,
                                    boxFit: BoxFit.cover,
                                    errorWidget: Image.network(
                                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                  )
                                  // Image.network(
                                  //                     item.image,
                                  //                     fit: BoxFit.cover,
                                  //                     // scale: 4,
                                  //                   ),
                                  ),
                            ),
                          )
                          .toList(),
                    ),
                    Container(
                      // color: Color .red,
                      padding: EdgeInsets.only(top: space2),
                      // height: height * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicator(),
                      ),
                    ),
                    SizedBox(
                      height: space2,
                    ),
                    Center(
                      child: Texttitle(title: "welcome, there"
                          // dataProvider.about!.title
                          ),
                    ),
                    SizedBox(
                      height: space2 / 2,
                    ),
                    Container(
                      width: barWidth,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "Since 2009, We provide highly personalized services in our elegant and sophisticated salon to ensure that every lady who visits us leaves felling beautiful, rejuvenated and relax like a real princess.",
                        // dataProvider.about!.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9E757C),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          // wordSpacing: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: barWidth,
                        child: TitleRow(local.products, () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  ProductsScreen(),
                            ),
                          );
                        }, true, Colors.black)),
                    Container(
                      // height: (260 / heightRatio) * height,
                      width: width,
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        childAspectRatio: 0.8,
                        // padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        children: List<Widget>.generate(
                            dataProvider.ourProducts.length > 4
                                ? 4
                                : dataProvider.ourProducts.length, (index) {
                          return FadedScaleAnimation(
                            ProductItemWidget(
                              item: dataProvider.ourProducts[index],
                              home: true,
                            ),
                            durationInMilliseconds: 300,
                          );
                        }),
                      ),

                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: paddingWidth),
                      //     physics: const BouncingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: offers.length,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding:
                      //             const EdgeInsetsDirectional.only(end: 14),
                      //         child: FadedScaleAnimation(
                      //           ProductItemWidget(
                      //             item: offers[index],
                      //             home: true,
                      //           ),
                      //           durationInMilliseconds: 300,
                      //         ),
                      //       );
                      //     }),
                    ),
                    SizedBox(
                        width: barWidth,
                        child: TitleRow(local.suggestions, () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const SuggestionsScreenn(),
                            ),
                          );
                        }, true, Colors.black)),
                    Container(
                      // height: (260 / heightRatio) * height,
                      width: width,
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        childAspectRatio: .8,
                        // padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        children: List<Widget>.generate(
                            dataProvider.suggestions.length > 4
                                ? 4
                                : dataProvider.suggestions.length, (index) {
                          return FadedScaleAnimation(
                            ProductItemWidget(
                              item: dataProvider.suggestions[index],
                              home: true,
                            ),
                            durationInMilliseconds: 300,
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: space,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
