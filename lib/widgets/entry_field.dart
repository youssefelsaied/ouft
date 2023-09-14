import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import '../helpers/colors.dart';

class EntryField extends StatefulWidget {
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
  final bool? allowHeight;
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

  EntryField({
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
    this.allowHeight,
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
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.symmetric(
      //   vertical: (0 / 804) * height,
      // ),
      alignment: Alignment.center,
      height: widget.allowHeight != null
          ? null
          : ((widget.label != null ? 80 : 48) / 804) * height,
      width: (343 / 375) * width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.label != null
              ? SizedBox(
                  height: (24 / 804) * height,
                  width: (343 / 375) * width,
                  child: AutoSizeText(widget.label!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 16)),
                )
              : const SizedBox.shrink(),
          Container(
            height: (45 / 804) * height,
            width: (343 / 375) * width,
            // color: kMainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    // scrollPadding: EdgeInsets.all(0),
                    textAlignVertical: widget.hint != null
                        ? TextAlignVertical.bottom
                        : TextAlignVertical.top,

                    maxLength: widget.maxLength ?? null,
                    controller: widget.controller,
                    initialValue: widget.initialValue,
                    readOnly: widget.readOnly ?? false,
                    obscureText: widget.obscure ?? false,
                    maxLines: widget.maxLines ?? 1,
                    validator: widget.onValidate,
                    inputFormatters: widget.numbersOnly == null
                        ? []
                        : [
                            FilteringTextInputFormatter.digitsOnly,
                            // FilteringTextInputFormatter.allow(RegExp('[0-9,+]')),
                          ],
                    onChanged: widget.onchanged,
                    // (value) {
                    //   if (widget.autoCheck != null) {
                    //     if (widget.autoCheck!) {
                    //       // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    //       auth.notifyListeners();
                    //     }
                    //   }
                    //   if (widget.allowSpace != null) {
                    //     print(widget.allowSpace);
                    //     if (!widget.allowSpace!) {
                    //       widget.controller!.text =
                    //           widget.controller!.text.replaceAll(RegExp(r' '), '');
                    //       // auth.notifyListeners();
                    //     }
                    //   }
                    // },
                    // textAlign: textAlign ?? TextAlign.right,
                    keyboardType: widget.textInputType,
                    decoration: InputDecoration(
                      hoverColor: kMainColor,
                      // icon: widget.icon,
                      prefixIcon: widget.icon,
                      suffixIcon: widget.suffix,
                      //  != null
                      //     ? Icon(
                      //         widget.prefixIcon,
                      //         color: kLightTextColor,
                      //         size: 18.5,
                      //       )
                      //     : null,
                      suffixIconColor: Colors.red,
                      // suffixIcon: InkWell(
                      //   child: Icon(widget.suffixIcon),
                      //   onTap: () {
                      //     widget.onsuffixIconTap!();
                      //   },
                      // ),
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(.8), fontSize: 12),
                      hintText: widget.hint,
                      filled: true,
                      fillColor: widget.color ?? const Color(0xffF4F4F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: widget.border != null
                            ? BorderSide(
                                color: Colors.grey.withOpacity(.1), width: .2)
                            : BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: widget.border != null
                            ? BorderSide(
                                color: Colors.grey.withOpacity(.7), width: 1)
                            : BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: widget.border != null
                            ? BorderSide(
                                color: Theme.of(context).primaryColor, width: 1)
                            : BorderSide.none,
                      ),
                    ),
                    onTap: widget.onTap as void Function()?,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
