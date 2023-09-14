import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'dimintions.dart';

class PageTemplateCenter extends StatefulWidget {
  final String title;
  final String txt;
  final List<Widget> children;
  final bool allowBack;
  final bool allowScroll;
  final Color color;
  final double contentHeight;
  const PageTemplateCenter({
    super.key,
    required this.title,
    required this.txt,
    required this.children,
    required this.allowBack,
    this.allowScroll = true,
    this.color = Colors.white,
    this.contentHeight = 650,
  });

  @override
  State<PageTemplateCenter> createState() => _PageTemplateCenterState();
}

class _PageTemplateCenterState extends State<PageTemplateCenter> {
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
                    height: space / 2,
                  ),
                  Container(
                      color: kMainColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      // height: backHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: iconSize,
                            child: widget.allowBack
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
                          ),
                          AutoSizeText(
                            widget.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: iconSize,
                          ),
                        ],
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
                        physics: widget.allowScroll
                            ? AlwaysScrollableScrollPhysics()
                            : NeverScrollableScrollPhysics(),
                        child: Column(children: widget.children)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
