import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ouft/helpers/colors.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:ouft/helpers/page_template_center.dart';
import 'package:ouft/screens/address_screens/add_address_screen.dart';
import 'package:ouft/widgets/address_item.dart';
import 'package:provider/provider.dart';

import '../../helpers/dimintions.dart';
import '../../providers/data_provider.dart';

class AddressShowScreen extends StatelessWidget {
  const AddressShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (520 / heightRatio) * height;
    final buttonHeight = (70 / heightRatio) * height;
    final space = (16 / heightRatio) * height;
    final marginWidth = (20 / widthRatio) * width;
    return PageTemplateCenter(
      allowBack: true,
      allowScroll: true,
      title: "Address",
      txt: "",
      children: [
        SizedBox(
          height: space,
        ),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: marginWidth, vertical: space),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "Shipping Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const AddAddressScreen(),
                    ),
                  );
                },
                child: AutoSizeText(
                  "Add Address",
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true, // This is important ⬇️️
            itemCount: data.userAddresses.length,
            itemBuilder: (c, i) => AddressItem(
              address: data.userAddresses[i],
            ),
          ),
        ),
      ],
    );
  }
}
