import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ouft/alarts/address_sucess_alart.dart';
import 'package:ouft/helpers/colors.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:ouft/helpers/page_template_center.dart';
import 'package:ouft/models/address_get.dart';
import 'package:ouft/models/area_get.dart';
import 'package:ouft/models/city_get.dart';
import 'package:ouft/providers/auth_provider.dart';
import 'package:ouft/widgets/address_item.dart';
import 'package:ouft/widgets/custom_button.dart';
import 'package:ouft/widgets/custom_entry_field.dart';
import 'package:ouft/widgets/entry_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../alarts/custom_alart.dart';
import '../../alarts/loading_alart.dart';
import '../../alarts/order_sucess_alart.dart';
import '../../helpers/dimintions.dart';
import '../../providers/data_provider.dart';

class EditAddressScreen extends StatefulWidget {
  AddressGetData address;
  EditAddressScreen({super.key, required this.address});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Future<void> AddAddressFun() async {
    final auth = Provider.of<Auth>(context, listen: false);
    final data = Provider.of<DataProvider>(context, listen: false);

    if (addressNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            "Please enter Address Name",
            textAlign: TextAlign.center,
          )));
    } else if (addressDetailsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            "Please enter Address Details",
            textAlign: TextAlign.center,
          )));
    } else if (numberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            "Please enter phone number",
            textAlign: TextAlign.center,
          )));
    } else {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return LoadingAlert();
          });

      final res = await data
          .editAdress(
              widget.address.id,
              addressNameController.text,
              addressDetailsController.text,
              numberController.text,
              widget.address.city.id,
              widget.address.area.id,
              auth.theUser!.token)
          .catchError((e) {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlert(
                title: "Error",
                msg: "can't Edit Address now, please try again later",
                action1: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText(
                    "ok",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kMainTextColor,
                    ),
                  ),
                ),
                action2: null,
              );
            });
      });
      Navigator.pop(context);
      if (res) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AddressSuccessAlert();
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlert(
                title: "Error",
                msg: "can't Add Address now, please try again later",
                action1: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText(
                    "ok",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: kMainTextColor,
                    ),
                  ),
                ),
                action2: null,
              );
            });
      }
    }
  }

  @override
  void initState() {
    final data = Provider.of<DataProvider>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    addressNameController.text = widget.address.fullName;
    addressDetailsController.text = widget.address.description;
    numberController.text = widget.address.mobile;
    // data.selectCity(widget.address.city, auth.theUser!.token);
    // data.selectArea(widget.address.area);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: true);
    final auth = Provider.of<Auth>(context, listen: true);
    var local = AppLocalizations.of(context)!;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (520 / heightRatio) * height;
    final buttonHeight = (70 / heightRatio) * height;
    final space = (16 / heightRatio) * height;
    final marginWidth = (20 / widthRatio) * width;
    return PageTemplateCenter(
      allowBack: true,
      allowScroll: true,
      title: "Edit Address",
      txt: "",
      children: [
        SizedBox(
          height: space,
        ),
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: marginWidth, vertical: space),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomEntryField(
                label: local.address_name,
                hint: "Ex: Home",
                controller: addressNameController,
              ),
              CustomEntryField(
                label: local.address_details,
                hint: "Ex: heba telwan",
                controller: addressDetailsController,
              ),
              CustomEntryField(
                label: local.phone,
                hint: "EX: +9245873691",
                controller: numberController,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: (7 / 804) * height,
              //   ),
              //   padding: EdgeInsets.symmetric(
              //       horizontal: marginWidth / 2, vertical: height * .01),
              //   decoration: BoxDecoration(
              //       color: kCardBackgroundColor,
              //       borderRadius: BorderRadius.circular(8)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       AutoSizeText(
              //         "City",
              //         style: TextStyle(color: Color(0xff73565A), fontSize: 14),
              //       ),
              //       DropdownButton<CityData>(
              //           hint: Text("City"),
              //           underline: Text(''),
              //           isExpanded: true,
              //           value: data.selectedCity,
              //           items: data.cities
              //               .map((e) => DropdownMenuItem<CityData>(
              //                     value: e,
              //                     child: Text(
              //                       e.title,
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                   ))
              //               .toList(),
              //           onChanged: (v) {
              //             data.selectCity(v!, auth.theUser!.token);
              //           }),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: (7 / 804) * height,
              //   ),
              //   padding: EdgeInsets.symmetric(
              //       horizontal: marginWidth / 2, vertical: height * .01),
              //   decoration: BoxDecoration(
              //       color: kCardBackgroundColor,
              //       borderRadius: BorderRadius.circular(8)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       AutoSizeText(
              //         "Area",
              //         style: TextStyle(color: Color(0xff73565A), fontSize: 14),
              //       ),
              //       DropdownButton<AreaData>(
              //           hint: Text("Area"),
              //           underline: Text(''),
              //           isExpanded: true,
              //           value: data.selectedArea,
              //           items: data.areaies
              //               .map((e) => DropdownMenuItem<AreaData>(
              //                     value: e,
              //                     child: Text(
              //                       e.title,
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                   ))
              //               .toList(),
              //           onChanged: (v) {
              //             data.selectArea(v!);
              //           }),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: (20 / heightRatio) * height,
              ),
              SizedBox(
                  height: (45 / heightRatio) * height,
                  child: CustomButton(
                      txt: local.confirm,
                      onTap: () {
                        AddAddressFun();
                      }))
            ],
          ),
        ),
      ],
    );
  }
}
