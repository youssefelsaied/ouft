import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Texttitle extends StatelessWidget {
  const Texttitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 2,
      style: const TextStyle(
          color: Colors.black,
          // letterSpacing: 1,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          height: 1.2),
      textAlign: TextAlign.center,
    );
  }
}
