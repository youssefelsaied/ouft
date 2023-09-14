import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../helpers/colors.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final double size;
  final Function? onTap;
  final bool? showViewAll;
  final Color? textColor;

  TitleRow(this.title, this.onTap, this.showViewAll,
      [this.textColor = Colors.black, this.size = 14]);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: size),
          ),
          onTap != null || showViewAll!
              ? InkWell(
                  onTap: onTap as void Function()?,
                  child: Text(
                    local.view_all,
                    style: TextStyle(color: Color(0xffC39199), fontSize: 12),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      // child: ListTile(
      //   contentPadding:
      //       const EdgeInsetsDirectional.only(start: 1.0, top: 0, bottom: 0),
      //   title: Text(
      //     title!,
      //     style: TextStyle(
      //         color: textColor, fontWeight: FontWeight.bold, fontSize: size),
      //   ),
      //   trailing: onTap != null || showViewAll!
      //       ? InkWell(
      //           onTap: onTap as void Function()?,
      //           child: Text(
      //             local.view_all,
      //             style: TextStyle(color: kDisabledColor, fontSize: 12),
      //           ),
      //         )
      //       : const SizedBox.shrink(),
      // ),
    );
  }
}
