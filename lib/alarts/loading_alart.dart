import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

class LoadingAlert extends StatefulWidget {
  LoadingAlert({
    super.key,
  });

  @override
  State<LoadingAlert> createState() => _LoadingAlertState();
}

class _LoadingAlertState extends State<LoadingAlert> {
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
                  "Loading",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kRedColor,
                  ),
                ),
                SizedBox(
                  height: space,
                ),
                CupertinoActivityIndicator(),
              ],
            )),
      ),
    );
  }
}
