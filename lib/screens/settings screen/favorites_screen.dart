import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ouft/helpers/page_template_center.dart';
import 'package:ouft/providers/auth_provider.dart';
import 'package:ouft/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/dimintions.dart';
import '../../providers/data_provider.dart';
import '../main screens/home_screen.dart';

class FavoritesScreenn extends StatefulWidget {
  const FavoritesScreenn({super.key});

  @override
  State<FavoritesScreenn> createState() => _FavoritesScreennState();
}

class _FavoritesScreennState extends State<FavoritesScreenn> {
  @override
  void initState() {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);
    dataProvider.getFavs(auth.theUser!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);

    var local = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (700 / heightRatio) * height;
    final contentWidth = (335 / widthRatio) * width;
    final backHeight = (24 / heightRatio) * height;
    final backWidth = (24 / widthRatio) * width;
    final logoHeight = (183 / heightRatio) * height;
    final logoWidth = (259 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final paddingWidth = ((widthRatio - 341) / widthRatio) * width / 2;
    final buttonWidth = (335 / widthRatio) * width;
    final itemWidth = (128 / widthRatio) * width;
    final spacing = (50 / widthRatio) * width;

    return PageTemplateCenter(
        title: local.favorite,
        txt: local.suggestions,
        allowBack: true,
        children: [
          Container(
            height: contentHeight,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: dataProvider.favourities.isEmpty
                ? Center(child: AutoSizeText(local.no + " " + local.favorite))
                : GridView.builder(
                    // shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: .9,
                      crossAxisSpacing: spacing,
                      childAspectRatio: (width / height) * 1.4,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: dataProvider.favourities.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: itemWidth,
                        padding:
                            const EdgeInsetsDirectional.only(end: 0, top: 10),
                        child: FadedScaleAnimation(
                          ProductItemWidget(
                            item: dataProvider.favourities[index].item,
                            home: false,
                          ),
                          durationInMilliseconds: 300,
                        ),
                      );
                    }),
          ),
        ]);
  }
}
