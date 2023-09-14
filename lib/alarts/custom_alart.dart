import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

class CustomAlert extends StatefulWidget {
  String title;
  String msg;
  final Widget? action1;
  final Widget? action2;
  CustomAlert({
    super.key,
    required this.title,
    required this.msg,
    this.action1,
    this.action2,
  });

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (470 / heightRatio) * height;
    final buttonHeight = (70 / heightRatio) * height;
    final space = (20 / heightRatio) * height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        // height: boxHeight,
        margin: EdgeInsets.symmetric(
            horizontal: width * .025, vertical: height * .02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
            border: Border.all(width: 1.25, color: kWhiteColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kRedColor,
                ),
              ),
              SizedBox(
                height: (10 / heightRatio) * height,
              ),
              AutoSizeText(
                widget.msg,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: ksecondTextColor,
                ),
              ),
              SizedBox(
                height: (20 / heightRatio) * height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.action1 == null ? Container() : widget.action1!,
                  widget.action1 != null && widget.action2 != null
                      ? SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            thickness: 2.5,
                            color: kContainerTextColor,
                          ),
                        )
                      : Container(),
                  widget.action2 == null ? Container() : widget.action2!,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
