import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:ouft/helpers/page_template.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/entry_field.dart';
import '../../widgets/filter_item.dart';
import '../../widgets/search_entry_field.dart';
import '../../widgets/title_row.dart';
import '../../widgets/title_row_black.dart';

import '../../helpers/colors.dart';
import '../../helpers/dimintions.dart';
import '../main screens/home_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class DataR {
  DataR({required this.x, required this.y});
  final double x;
  final double y;
}

class _SearchScreenState extends State<SearchScreen> {
  List<DataR> getChartData() {
    return <DataR>[
      DataR(x: 2.0, y: 2.2),
      DataR(x: 3.0, y: 3.4),
      DataR(x: 4.0, y: 2.8),
      DataR(x: 5.0, y: 1.6),
      DataR(x: 6.0, y: 2.3),
      DataR(x: 7.0, y: 2.5),
      DataR(x: 8.0, y: 2.9),
      DataR(x: 9.0, y: 3.8),
      DataR(x: 10.0, y: 3.7),
    ];
  }

  SfRangeValues _values = const SfRangeValues(40.0, 80.0);

  List<String> lastSearches = ["الدكتور أحمد محمود ", "العيادات"];

  List<int> ratesFilter = [1, 2, 3, 4, 5];
  List<String> timesFilter = ["5:00 Am", "10:00 Am"];

  TextEditingController searchController = TextEditingController();
  final double dateMin = 2.0;
  final double dateMax = 11.0;
  final SfRangeValues dateValues = const SfRangeValues(2.0, 11.0);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var local = AppLocalizations.of(context)!;
    List<String> categoriesFilter = [
      local.hospitals,
      local.doctors,
      local.clinics,
      local.mediciens,
      local.mediciens_delivery,
      local.healthy_food,
      local.labs,
      local.med_repo,
      local.consulting,
    ];
    final space = (13 / heightRatio) * height;
    final contentHeight = (700 / heightRatio) * height;
    final contentWidth = (343 / widthRatio) * width;
    final barHeight = (48 / heightRatio) * height;
    final filterItemHeight = (50 / heightRatio) * height;
    final barWidth = (343 / widthRatio) * width;
    final searchBarHeight = (45 / heightRatio) * height;
    final searchBarWidth = (291 / widthRatio) * width;
    final iconHeight = (32 / heightRatio) * height;
    final iconBarWidth = (21 / widthRatio) * width;

    final rightBarWidth = (145 / widthRatio) * width;
    final imgHeight = (48 / heightRatio) * height;
    final imgWidth = (48 / widthRatio) * width;
    final helloHeight = (28 / heightRatio) * height;
    final helloWidth = (87 / widthRatio) * width;
    final morningHeight = (20 / heightRatio) * height;
    final morningWidth = (80 / widthRatio) * width;

    final offerHeight = (200 / heightRatio) * height;
    final offerWidth = (350 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;
    final paddingWidth = ((widthRatio - 341) / widthRatio) * width / 2;
    return PageTemplate(
        title: local.search,
        txt: local.search_txt,
        allowBack: true,
        children: [
          SizedBox(
            height: space * 2,
          ),
          SizedBox(
            width: barWidth,
            height: searchBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: searchBarHeight,
                  width: barWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  // margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      border: Border.all(color: kMainColor),
                      borderRadius: BorderRadius.circular(18)),
                  // decoration: BoxDecoration(
                  //     color: kSearchColor.withOpacity(0.12),
                  //     borderRadius: BorderRadius.circular(8)),
                  child: SearchEntryField(
                    hint: local.search_here,
                    controller: searchController,
                    icon: Icon(
                      Icons.search,
                      size: 18,
                      color: ksecondTextColor,
                    ),
                    onchanged: (c) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: space * .7,
          ),
          // searchController.text.isNotEmpty
          //     ? SizedBox(
          //         width: barWidth,
          //         child: Column(
          //           children: doctors
          //               .map((e) => Container(
          //                     decoration: BoxDecoration(
          //                         color: Colors.white,
          //                         borderRadius: BorderRadius.circular(8)),
          //                     margin: EdgeInsets.symmetric(
          //                         vertical: morningHeight / 3),
          //                     padding: EdgeInsets.symmetric(
          //                         horizontal: paddingWidth / 2,
          //                         vertical: paddingWidth / 2),
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Row(
          //                           children: [
          //                             SizedBox(
          //                               // color: Colors.red,
          //                               width: imgWidth,
          //                               height: imgHeight,
          //                               child: Image.asset(
          //                                 e.imageName,
          //                                 fit: BoxFit.scaleDown,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               width: paddingWidth,
          //                             ),
          //                             Text(
          //                               e.title,
          //                               style: const TextStyle(
          //                                   color: Colors.black, fontSize: 20),
          //                             ),
          //                           ],
          //                         ),
          //                         const Icon(Icons.clear)
          //                       ],
          //                     ),
          //                   ))
          //               .toList(),
          //         ),
          //       )
          //     : SizedBox(
          //         width: barWidth,
          //         child: Column(
          //           children: lastSearches
          //               .map((e) => Container(
          //                     margin: EdgeInsets.symmetric(
          //                         vertical: morningHeight / 2),
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [Text(e), const Icon(Icons.clear)],
          //                     ),
          //                   ))
          //               .toList(),
          //         ),
          //       )
        ]);
    // Scaffold(
    //   backgroundColor: kCardBackgroundColor,
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Center(
    //         child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               SizedBox(
    //                 height: space,
    //               ),
    //               SizedBox(
    //                 width: barWidth,
    //                 height: searchBarHeight,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       alignment: Alignment.center,
    //                       height: searchBarHeight,
    //                       width: iconBarWidth,
    //                       // color: Colors.red,
    //                       child: InkWell(
    //                           onTap: () {
    //                             Navigator.pop(context);
    //                           },
    //                           child: Icon(
    //                             Icons.arrow_back_ios,
    //                             color: kBackIconColor,
    //                             size: 18,
    //                           )),
    //                     ),
    //                     Container(
    //                       height: searchBarHeight,
    //                       width: searchBarWidth,
    //                       padding: const EdgeInsets.symmetric(horizontal: 8),
    //                       // margin: const EdgeInsets.symmetric(horizontal: 16),
    //                       decoration: BoxDecoration(
    //                           color: kSearchColor.withOpacity(0.12),
    //                           borderRadius: BorderRadius.circular(8)),
    //                       child: SearchEntryField(
    //                         hint: local.search_here,
    //                         controller: searchController,
    //                         icon: Icon(
    //                           Icons.search,
    //                           size: 18,
    //                           color: ksecondTextColor,
    //                         ),
    //                         onchanged: (c) {
    //                           setState(() {});
    //                         },
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: iconBarWidth,
    //                       height: searchBarHeight,
    //                       child: GestureDetector(
    //                         onTap: () {
    //                           showModalBottomSheet(
    //                               isScrollControlled: true,
    //                               context: context,
    //                               constraints: BoxConstraints(
    //                                   minHeight: 400,
    //                                   maxWidth: width,
    //                                   maxHeight: 800),
    //                               shape: const RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.vertical(
    //                                   top: Radius.circular(20),
    //                                 ),
    //                               ),
    //                               // clipBehavior: Clip.antiAliasWithSaveLayer,
    //                               builder: (c) {
    //                                 return SizedBox(
    //                                     height: contentHeight,
    //                                     width: width,
    //                                     child: SingleChildScrollView(
    //                                       child: Column(
    //                                         children: [
    //                                           SizedBox(
    //                                             height: space,
    //                                           ),
    //                                           Container(
    //                                             width: 38,
    //                                             height: 4,
    //                                             decoration: BoxDecoration(
    //                                                 color:
    //                                                     const Color(0xffACB7CA),
    //                                                 borderRadius:
    //                                                     BorderRadius.circular(
    //                                                         12)),
    //                                           ),
    //                                           SizedBox(
    //                                             height: space * 2,
    //                                           ),
    //                                           Text(
    //                                             "الفرز والتصفية",
    //                                             style: TextStyle(
    //                                                 color: kMain2Color,
    //                                                 fontSize: 20),
    //                                           ),
    //                                           SizedBox(
    //                                             height: space * 1,
    //                                           ),
    //                                           const Padding(
    //                                             padding: EdgeInsets.symmetric(
    //                                                 horizontal: 10.0),
    //                                             child: Divider(
    //                                               thickness: 1,
    //                                               color: Colors.black,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             width: contentWidth,
    //                                             child: TitleRow(
    //                                                 local.categories,
    //                                                 null,
    //                                                 false,
    //                                                 Colors.black),
    //                                           ),
    //                                           SizedBox(
    //                                               width: width,
    //                                               // height: filterItemHeight,
    //                                               child: SingleChildScrollView(
    //                                                 scrollDirection:
    //                                                     Axis.horizontal,
    //                                                 child: Row(
    //                                                   children: categoriesFilter
    //                                                       .map((e) =>
    //                                                           FilterItem(
    //                                                               item:
    //                                                                   Text(e)))
    //                                                       .toList(),
    //                                                 ),
    //                                               )),
    //                                           // SizedBox(
    //                                           //   width: width,
    //                                           //   child: SfRangeSelector(
    //                                           //     min: dateMin,
    //                                           //     max: dateMax,
    //                                           //     initialValues: dateValues,
    //                                           //     // labelPlacement:
    //                                           //     //     LabelPlacement.betweenTicks,
    //                                           //     interval: 1,
    //                                           //     // dateIntervalType:
    //                                           //     //     DateIntervalType.years,
    //                                           //     // dateFormat: DateFormat.y(),
    //                                           //     showTicks: true,
    //                                           //     showLabels: true,
    //                                           //     child: SizedBox(
    //                                           //       height: 200,
    //                                           //       child: SfCartesianChart(
    //                                           //         margin:
    //                                           //             const EdgeInsets.all(0),
    //                                           //         // primaryXAxis: ChartAxis(
    //                                           //         //   // minimum: dateMin,
    //                                           //         //   // maximum: dateMax,
    //                                           //         //   isVisible: false,
    //                                           //         // ),
    //                                           //         primaryYAxis: NumericAxis(
    //                                           //             isVisible: false,
    //                                           //             maximum: 4),
    //                                           //         series: <
    //                                           //             SplineAreaSeries<DataR,
    //                                           //                 double>>[
    //                                           //           SplineAreaSeries<DataR,
    //                                           //                   double>(
    //                                           //               dataSource:
    //                                           //                   getChartData(),
    //                                           //               xValueMapper: (DataR
    //                                           //                           sales,
    //                                           //                       int index) =>
    //                                           //                   sales.x,
    //                                           //               yValueMapper: (DataR
    //                                           //                           sales,
    //                                           //                       int index) =>
    //                                           //                   sales.y)
    //                                           //         ],
    //                                           //       ),
    //                                           //     ),
    //                                           //   ),
    //                                           // ),

    //                                           SizedBox(
    //                                             width: contentWidth,
    //                                             child: TitleRow("متوسط الاسعار",
    //                                                 null, false, Colors.black),
    //                                           ),
    //                                           SfRangeSlider(
    //                                             min: 0.0,
    //                                             max: 100.0,
    //                                             values: _values,
    //                                             interval: 20,
    //                                             showTicks: true,
    //                                             showLabels: true,
    //                                             enableTooltip: true,
    //                                             minorTicksPerInterval: 1,
    //                                             onChanged:
    //                                                 (SfRangeValues values) {
    //                                               setState(() {
    //                                                 _values = values;
    //                                               });
    //                                             },
    //                                           ),
    //                                           SizedBox(
    //                                             width: contentWidth,
    //                                             child: TitleRow(local.ratings,
    //                                                 null, false, Colors.black),
    //                                           ),
    //                                           SizedBox(
    //                                               width: width,
    //                                               // height: filterItemHeight,
    //                                               child: SingleChildScrollView(
    //                                                 scrollDirection:
    //                                                     Axis.horizontal,
    //                                                 child: Row(
    //                                                   children: ratesFilter
    //                                                       .map((e) =>
    //                                                           FilterItem(
    //                                                               item: Row(
    //                                                             children: [
    //                                                               Text(e
    //                                                                   .toString()),
    //                                                               Icon(
    //                                                                 Icons.star,
    //                                                                 color:
    //                                                                     KGold,
    //                                                               ),
    //                                                             ],
    //                                                           )))
    //                                                       .toList(),
    //                                                 ),
    //                                               )),
    //                                           SizedBox(
    //                                             width: contentWidth,
    //                                             child: TitleRow(local.time,
    //                                                 null, false, Colors.black),
    //                                           ),
    //                                           SizedBox(
    //                                               width: width,
    //                                               // height: filterItemHeight,
    //                                               child: SingleChildScrollView(
    //                                                 scrollDirection:
    //                                                     Axis.horizontal,
    //                                                 child: Row(
    //                                                   children: timesFilter
    //                                                       .map((e) =>
    //                                                           FilterItem(
    //                                                               item:
    //                                                                   Text(e)))
    //                                                       .toList(),
    //                                                 ),
    //                                               )),
    //                                           SizedBox(
    //                                             height: space,
    //                                           ),
    //                                           const Padding(
    //                                             padding: EdgeInsets.symmetric(
    //                                                 horizontal: 10.0),
    //                                             child: Divider(
    //                                               thickness: 1,
    //                                               color: Colors.black,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             height: space * 1,
    //                                           ),
    //                                           SizedBox(
    //                                             height: buttonHeight,
    //                                             width: buttonWidth,
    //                                             child: CustomButton(
    //                                                 txt: local.confirm,
    //                                                 onTap: () {}),
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ));
    //                               });
    //                         },
    //                         child: SvgPicture.asset("assets/images/filter.svg"),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: space * .7,
    //               ),
    //               searchController.text.isNotEmpty
    //                   ? SizedBox(
    //                       width: barWidth,
    //                       child: Column(
    //                         children: doctors
    //                             .map((e) => Container(
    //                                   decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius:
    //                                           BorderRadius.circular(8)),
    //                                   margin: EdgeInsets.symmetric(
    //                                       vertical: morningHeight / 3),
    //                                   padding: EdgeInsets.symmetric(
    //                                       horizontal: paddingWidth / 2,
    //                                       vertical: paddingWidth / 2),
    //                                   child: Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Row(
    //                                         children: [
    //                                           SizedBox(
    //                                             // color: Colors.red,
    //                                             width: imgWidth,
    //                                             height: imgHeight,
    //                                             child: Image.asset(
    //                                               e.imageName,
    //                                               fit: BoxFit.scaleDown,
    //                                             ),
    //                                           ),
    //                                           SizedBox(
    //                                             width: paddingWidth,
    //                                           ),
    //                                           Text(
    //                                             e.title,
    //                                             style: const TextStyle(
    //                                                 color: Colors.black,
    //                                                 fontSize: 20),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                       const Icon(Icons.clear)
    //                                     ],
    //                                   ),
    //                                 ))
    //                             .toList(),
    //                       ),
    //                     )
    //                   : SizedBox(
    //                       width: barWidth,
    //                       child: Column(
    //                         children: lastSearches
    //                             .map((e) => Container(
    //                                   margin: EdgeInsets.symmetric(
    //                                       vertical: morningHeight / 2),
    //                                   child: Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       Text(e),
    //                                       const Icon(Icons.clear)
    //                                     ],
    //                                   ),
    //                                 ))
    //                             .toList(),
    //                       ),
    //                     )
    //             ]),
    //       ),
    //     ),
    //   ),
    // );
  }
}
