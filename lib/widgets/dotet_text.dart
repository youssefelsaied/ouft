import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class DotetText extends StatelessWidget {
  const DotetText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .9,
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: kMain3Color,
            size: 7,
          ),
          SizedBox(
            width: 6,
          ),
          SizedBox(
            width: width * .8,
            child: AutoSizeText(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: kMain3Color,
                  // letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  height: 1.2),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
