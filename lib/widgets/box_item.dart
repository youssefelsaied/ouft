import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../helpers/colors.dart';
import '../helpers/dimintions.dart';

class BoxItem extends StatelessWidget {
  const BoxItem({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: width * .05, vertical: height * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhiteColor,
          border: Border.all(width: 1.25, color: kWhiteColor)),
      child: child,
    );
  }
}
