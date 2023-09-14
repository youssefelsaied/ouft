import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../alarts/custom_alart.dart';
import '../alarts/loading_alart.dart';
import '../helpers/colors.dart';
import '../helpers/dimintions.dart';
import '../models/address_get.dart';
import '../providers/auth_provider.dart';
import '../providers/data_provider.dart';
import '../screens/address_screens/edit_address_screen.dart';

class AddressItem extends StatelessWidget {
  AddressGetData address;
  AddressItem({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: true);
    final auth = Provider.of<Auth>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = (20 / heightRatio) * height;
    final contentHeight = (650 / heightRatio) * height;
    final contentWidth = (72 / widthRatio) * width;
    final paddingWidth = (20 / widthRatio) * width;
    final imgHeight = (56 / heightRatio) * height;
    final bottonHeight = (48 / heightRatio) * height;
    final imgWidth = (73 / widthRatio) * width;

    final txtHeight = (42 / heightRatio) * height;
    final marginWidth = (24 / widthRatio) * width;
    final topNotch = MediaQuery.of(context).padding.top;
    final bottomNotch = MediaQuery.of(context).padding.bottom;
    return Dismissible(
      behavior: HitTestBehavior.translucent,
      // onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlert(
                title: "Delete  ${address.fullName}",
                msg: "are you sure to delete this item",
                action1: InkWell(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return LoadingAlert();
                        });
                    await data
                        .deleteAdress(address.id, auth.theUser!.token)
                        .catchError((e) {
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                    });
                    Navigator.of(context).pop(true);
                    Navigator.of(context).pop(true);
                  },
                  child: AutoSizeText(
                    "Ok",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kMainColor,
                    ),
                  ),
                ),
                action2: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: AutoSizeText(
                    "No",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kMainTextColor,
                    ),
                  ),
                ),
              );
            });
      },
      key: ValueKey(address),
      background: Container(
        // most importantly, do not forget to give the inner container a
        // padding to the right so that our icon does not stick to the
        // wall of the container when swiping

        padding: const EdgeInsets.only(
          right: 16,
        ),
        color: Colors.white,
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffF7F7F9),
          ),
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(
            "assets/images/trash.svg",
            color: Colors.red,
          ),
        ),
      ),

      child: InkWell(
        onTap: () {
          data.selectAddress(address);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: marginWidth, vertical: space / 4),
          padding: EdgeInsets.symmetric(
              horizontal: marginWidth, vertical: space / 2),
          decoration: BoxDecoration(
            color: kCardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kMain2Color)),
                    child: Icon(
                      Icons.circle,
                      color: data.selectedAddress != null &&
                              data.selectedAddress!.id == address.id
                          ? kMain2Color
                          : kCardBackgroundColor,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: space,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        address.fullName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      AutoSizeText(
                        address.mobile,
                        style: TextStyle(
                            color: kMain4Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      AutoSizeText(
                        address.description,
                        style: TextStyle(
                            color: kMain4Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              data.selectedAddress != null &&
                      data.selectedAddress!.id == address.id
                  ? InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                EditAddressScreen(
                              address: address,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset("assets/images/edit.svg"),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
