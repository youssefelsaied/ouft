import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../helpers/colors.dart';
import '../../providers/data_provider.dart';
import '../../widgets/product_item_widget.dart';

import '../../helpers/dimintions.dart';
import '../main screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final dataProvider = Provider.of<DataProvider>(context, listen: true);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = (20 / heightRatio) * height;
    final contentHeight = (650 / heightRatio) * height;
    final contentWidth = (72 / widthRatio) * width;
    final paddingWidth = (20 / widthRatio) * width;
    final imgHeight = (56 / heightRatio) * height;
    final imgWidth = (53 / widthRatio) * width;

    final topNotch = MediaQuery.of(context).padding.top;
    final bottomNotch = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: topNotch,
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: (31 / widthRatio) * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: (8 / widthRatio) * width,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                ),
                SizedBox(
                  child: Container(
                      // color: Colors.red,
                      width: imgWidth,
                      height: imgHeight,
                      child: Image.asset("assets/images/logo.png")),
                ),
                SizedBox(
                  width: (8 / widthRatio) * width,
                ),
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: (31 / widthRatio) * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  local.products,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
            height: contentHeight,
            width: width,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.75,
                // padding: const EdgeInsets.symmetric(horizontal: 40.0),
                children: List<Widget>.generate(dataProvider.ourProducts.length,
                    (index) {
                  return FadedScaleAnimation(
                    ProductItemWidget(
                      item: dataProvider.ourProducts[index],
                      home: false,
                    ),
                    durationInMilliseconds: 300,
                  );
                }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
