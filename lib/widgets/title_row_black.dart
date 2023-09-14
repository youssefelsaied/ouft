import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../helpers/colors.dart';

class TitleRowBlack extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool? showViewAll;

  TitleRowBlack(this.title, this.onTap, this.showViewAll);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.only(start: 1.0),
      title: Text(
        title!,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      trailing: onTap != null || showViewAll!
          ? TextButton(
              onPressed: onTap as void Function()?,
              child: Text(
                AppLocalizations.of(context)!.view_all,
                style: TextStyle(color: kDisabledColor, fontSize: 12),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
