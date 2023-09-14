import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:ouft/helpers/page_template.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ouft/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/dimintions.dart';
import '../../providers/data_provider.dart';
import '../main screens/home_screen.dart';

class SuggestionsScreenn extends StatefulWidget {
  const SuggestionsScreenn({super.key});

  @override
  State<SuggestionsScreenn> createState() => _SuggestionsScreennState();
}

class _SuggestionsScreennState extends State<SuggestionsScreenn> {
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

    return PageTemplate(
        title: local.suggestions,
        txt: local.suggestions,
        allowBack: true,
        children: [
          Container(
            height: contentHeight,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: GridView.builder(
                // shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: .9,
                  crossAxisSpacing: spacing,
                  childAspectRatio: (width / height) * 1.4,
                ),
                padding: EdgeInsets.symmetric(horizontal: 2),
                scrollDirection: Axis.vertical,
                itemCount: dataProvider.suggestions.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: itemWidth,
                    padding: const EdgeInsetsDirectional.only(end: 0, top: 10),
                    child: FadedScaleAnimation(
                      ProductItemWidget(
                        item: dataProvider.suggestions[index],
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
