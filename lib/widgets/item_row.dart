import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../helpers/colors.dart';

class ItemRow extends StatelessWidget {
  final String? title1;
  final String? title2;
  final double size;
  final FontWeight weight;
  final Color color;

  ItemRow(this.title1, this.title2,
      [this.size = 16,
      this.weight = FontWeight.w700,
      this.color = const Color(0xffB0828A)]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1!,
          style: TextStyle(color: color, fontWeight: weight, fontSize: size),
        ),
        Text(
          title2!,
          style: TextStyle(
              color: Color(0xff8E44AD),
              fontSize: size,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
    // ListTile(
    //   contentPadding: const EdgeInsetsDirectional.only(start: 1.0),
    //   title: Text(
    //     title1!,
    //     style: TextStyle(
    //         color: Colors.black, fontWeight: FontWeight.bold, fontSize: size),
    //   ),
    //   trailing: Text(
    //     AppLocalizations.of(context)!.view_all,
    //     style: TextStyle(color: kDisabledColor, fontSize: 12),
    //   ),
    // );
  }
}
