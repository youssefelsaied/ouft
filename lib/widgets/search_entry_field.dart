import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import '../helpers/colors.dart';

import '../helpers/dimintions.dart';

class SearchEntryField extends StatefulWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Widget? icon;
  final Color? color;
  final bool? border;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final bool? numbersOnly;
  final bool? autoCheck;
  final bool? obscure;
  final bool? allowSpace;
  final TextAlign? textAlign;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final Function? onTap;
  final String? Function(String?)? onValidate;
  final Function? onsuffixIconTap;
  final Function(String)? onchanged;
  final Widget? suffix;

  SearchEntryField({
    this.hint,
    this.prefixIcon,
    this.icon,
    this.color,
    this.border,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.numbersOnly,
    this.autoCheck,
    this.obscure,
    this.allowSpace,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.onValidate,
    this.onsuffixIconTap,
    this.onchanged,
    this.suffix,
  });

  @override
  State<SearchEntryField> createState() => _SearchEntryFieldState();
}

class _SearchEntryFieldState extends State<SearchEntryField> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final searchBarHeight = (40 / heightRatio) * height;
    final searchBarWidth = (291 / widthRatio) * width;

    return Container(
      alignment: Alignment.center,
      height: searchBarHeight,
      width: searchBarWidth,
      child: TextFormField(
        scrollPadding: EdgeInsets.all(0),
        // expands: true,
        style: TextStyle(color: ksecondTextColor, fontSize: 14),
        textAlignVertical: widget.hint != null
            ? TextAlignVertical.bottom
            : TextAlignVertical.center,
        maxLength: widget.maxLength ?? null,
        controller: widget.controller,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly ?? false,
        obscureText: widget.obscure ?? false,
        maxLines: widget.maxLines ?? 1,
        validator: widget.onValidate,
        cursorHeight: searchBarHeight * .5,
        cursorColor: ksecondTextColor,
        inputFormatters: widget.numbersOnly == null
            ? []
            : [
                FilteringTextInputFormatter.digitsOnly,
                // FilteringTextInputFormatter.allow(RegExp('[0-9,+]')),
              ],
        onChanged: widget.onchanged,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          hoverColor: kMainColor,
          icon: widget.icon,
          suffixIconColor: Colors.red,
          hintStyle: TextStyle(color: ksecondTextColor, fontSize: 14),
          counterStyle: TextStyle(color: ksecondTextColor, fontSize: 10),
          hintText: widget.hint,
          filled: true,
          suffixStyle: TextStyle(color: ksecondTextColor, fontSize: 10),
          fillColor: widget.color ?? const Color(0xffFFFF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.border != null
                ? BorderSide(color: Colors.grey.withOpacity(.1), width: .2)
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.border != null
                ? BorderSide(color: Colors.grey.withOpacity(.7), width: 1)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.border != null
                ? BorderSide(color: Theme.of(context).primaryColor, width: 1)
                : BorderSide.none,
          ),
        ),
        onTap: widget.onTap as void Function()?,
      ),
    );
  }
}
