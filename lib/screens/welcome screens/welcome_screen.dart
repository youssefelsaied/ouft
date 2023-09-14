import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ouft/helpers/colors.dart';
import 'package:ouft/wrappers/wrapper_auth.dart';
import '../../helpers/dimintions.dart';
import '../../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

List items = [
  {
    "title": "Book Your Appointment",
    "description":
        "Discover a world of beauty possibilities as you explore our extensive range of services. From haircuts and color treatments to facials, waxing, and more, our salon offers",
    "image": "assets/images/welcome1.png"
  },
  {
    "title": "Explore Our Services",
    "description":
        "Simply select your desired service, choose a date and time that suits you best, and let our app handle the rest. You'll receive instant confirmation and reminders, ensuring you never miss a chance to treat yourself.",
    "image": "assets/images/welcome2.png"
  },
  {
    "title": "Welcome to our Beauty Salon",
    "description":
        "Discover a world of beauty possibilities as you explore our extensive range of services. From haircuts and color treatments to facials, waxing, and more, our salon offers",
    "image": "assets/images/welcome1.png"
  },
];

class _WelcomeScreenState extends State<WelcomeScreen> {
  double currentPage = 0.0;

  List<Widget> indicator() => List<Widget>.generate(
      items.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 8.0,
            width: currentPage.round() == index ? 41 : 8.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? kMainColor
                    : const Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));
  final _imageViewController = PageController();
  final _contentViewController = PageController();
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final space = (53 / heightRatio) * height;
    final space2 = (20 / heightRatio) * height;
    final contentHeight = (345 / heightRatio) * height;
    final contentWidth = (375 / widthRatio) * width;
    final textContentHeight = (138 / heightRatio) * height;
    final textContentWidth = (330 / widthRatio) * width;
    final titleContentHeight = (76 / heightRatio) * height;
    final desContentHeight = (54 / heightRatio) * height;
    final imageHeight = (511 / heightRatio) * height;
    final imageWidth = (375 / widthRatio) * width;
    return Scaffold(
      body: Container(
          height: height,
          child: Stack(
            children: [
              Container(
                // color: Colors.red,
                height: imageHeight,
                width: width,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _imageViewController,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    _imageViewController.addListener(() {
                      setState(() {
                        currentPage = _imageViewController.page!;
                      });
                      // _contentViewController.jumpTo(_imageViewController.page!);
                    });
                    return items
                        .map((item) => SizedBox(
                              height: imageHeight,
                              width: width,
                              child: Image.asset(
                                item['image'],
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.fill,
                              ),
                            ))
                        .toList()[index];
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  width: contentWidth,
                  height: contentHeight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: space,
                      ),
                      Container(
                        width: textContentWidth,
                        height: textContentHeight,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _contentViewController,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              _contentViewController.addListener(() {
                                setState(() {
                                  currentPage = _contentViewController.page!;
                                  // _imageViewController
                                  //     .jumpTo(_contentViewController.page!);
                                });
                              });
                              return items
                                  .map((item) => Container(
                                      width: textContentWidth,
                                      height: textContentHeight,

                                      // padding: EdgeInsets.symmetric(horizontal: 18.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            height: titleContentHeight,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: AutoSizeText(
                                              item['title'],
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  // letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25.0,
                                                  height: 1.2),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            height: desContentHeight,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: AutoSizeText(
                                              item['description'],
                                              maxLines: 2,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                // letterSpacing: 1,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      )))
                                  .toList()[index];
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: space2),
                        // height: height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: indicator(),
                        ),
                      ),
                      SizedBox(
                          height: space,
                          child: CustomButton(
                            txt: local.confirm,
                            onTap: () {
                              if (currentPage != items.length - 1) {
                                _imageViewController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut);
                                _contentViewController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut);
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        WrapperAuth(),
                                  ),
                                );
                              }
                            },
                          )),
                      // SizedBox(
                      //   height: height * .05,
                      // ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //     top: 0,
              //     right: 0,
              //     child: IconButton(
              //       icon: Icon(
              //         Icons.arrow_back_ios,
              //         color: Colors.white,
              //       ),
              //       onPressed: () {
              //         _imageViewController.previousPage(
              //             duration: const Duration(milliseconds: 200),
              //             curve: Curves.easeInOut);
              //         _contentViewController.previousPage(
              //             duration: const Duration(milliseconds: 200),
              //             curve: Curves.easeInOut);
              //       },
              //     ))
            ],
          )),
    );
  }
}
