import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'dimintions.dart';

class PageTemplate extends StatefulWidget {
  final String title;
  final String txt;
  final List<Widget> children;
  final bool allowBack;
  final Color color;
  final double contentHeight;
  const PageTemplate({
    super.key,
    required this.title,
    required this.txt,
    required this.children,
    required this.allowBack,
    this.color = Colors.white,
    this.contentHeight = 630,
  });

  @override
  State<PageTemplate> createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final heightNoNotch = height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;

    final space = (20 / heightRatio) * height;
    final iconSize = (24 / widthRatio) * width;
    final horizontalPadding = (16 / widthRatio) * width;
    final contentHeight = (widget.contentHeight / heightRatio) * height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kMainColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Container(
            height: height,
            // color: Colors.red,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: space * 2,
                  ),
                  Container(
                      color: kMainColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      // height: backHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.allowBack
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: kWhiteColor,
                                    size: iconSize,
                                  ),
                                )
                              : Container(),
                          widget.allowBack
                              ? SizedBox(
                                  height: space * 2,
                                )
                              : Container(),
                          AutoSizeText(
                            widget.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: 35,
                            height: 3,
                            color: kWhiteColor,
                            // height: backHeight,
                          ),
                        ],
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      color: kMainColor,
                      // height: backHeight,
                      child: AutoSizeText(
                        widget.txt,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    width: width,
                    height: contentHeight,
                    decoration: BoxDecoration(
                        color: widget.color,
                        // ignore: prefer_const_constructors
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40),
                          topRight: const Radius.circular(40),
                        )),
                    padding: EdgeInsets.only(
                      top: 2,
                    ),
                    child: SingleChildScrollView(
                        child: Column(children: widget.children)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
