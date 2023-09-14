import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/dimintions.dart';
import '../widgets/custom_button.dart';

class OrderSuccessAlert extends StatefulWidget {
  String orderId;
  OrderSuccessAlert({
    super.key,
    required this.orderId,
  });

  @override
  State<OrderSuccessAlert> createState() => _OrderSuccessAlertState();
}

class _OrderSuccessAlertState extends State<OrderSuccessAlert> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (470 / heightRatio) * height;
    final buttonHeight = (48 / heightRatio) * height;
    final buttonWidth = (215 / widthRatio) * width;
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
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: space),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kCardBackgroundColor),
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  "assets/images/success.png",
                  fit: BoxFit.scaleDown,
                  scale: 5,
                ),
              ),
              SizedBox(
                height: (10 / heightRatio) * height,
              ),
              AutoSizeText(
                "Your Booking Is Successful",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: (10 / heightRatio) * height,
              ),
              // AutoSizeText(
              //   "Order id : " + widget.orderId,
              //   maxLines: 4,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: ksecondTextColor,
              //   ),
              // ),
              // SizedBox(
              //   height: (20 / heightRatio) * height,
              // ),
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: CustomButton(
                  txt: "Back To Home",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  radius: 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
