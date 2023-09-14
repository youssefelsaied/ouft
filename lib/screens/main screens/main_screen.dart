import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ouft/helpers/dimintions.dart';
import 'package:ouft/screens/cart_screens/cart_screen.dart';
import '../../helpers/colors.dart';
import '../../helpers/txt_style.dart';
import '../../models/nav_btn.dart';
import '../../screens/main%20screens/account_screen.dart';
import '../../widgets/custom_paint.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    CartScreen(
      home: true,
    ),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          backgroundColor: kWhiteColor,
          // appBar: AppBar(
          //   title: const Text('BottomNavigationBar Sample'),
          // ),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              color: Colors.white,
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ),
          bottomNavigationBar: navigationBar()

          //  ClipRRect(
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(8.0),
          //     topRight: Radius.circular(8.0),
          //   ),
          //   child: BottomNavigationBar(
          //     items: <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(
          //           "assets/images/home.svg",
          //           fit: BoxFit.cover,
          //           color: kDisabledColor,
          //         ),
          //         activeIcon: SvgPicture.asset(
          //           "assets/images/home.svg",
          //           fit: BoxFit.cover,
          //           color: kMainColor,
          //         ),
          //         label: local.main,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(
          //           "assets/images/category.svg",
          //           fit: BoxFit.cover,
          //           color: kDisabledColor,
          //         ),
          //         activeIcon: SvgPicture.asset(
          //           "assets/images/category.svg",
          //           fit: BoxFit.cover,
          //           color: kMainColor,
          //         ),
          //         label: local.matches,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(
          //           "assets/images/shopping-cart.svg",
          //           fit: BoxFit.cover,
          //           color: kDisabledColor,
          //         ),
          //         activeIcon: SvgPicture.asset(
          //           "assets/images/shopping-cart.svg",
          //           fit: BoxFit.cover,
          //           color: kMainColor,
          //         ),
          //         label: local.cart,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(
          //           "assets/images/fav.svg",
          //           fit: BoxFit.cover,
          //           color: kDisabledColor,
          //         ),
          //         activeIcon: SvgPicture.asset(
          //           "assets/images/fav.svg",
          //           fit: BoxFit.cover,
          //           color: kMainColor,
          //         ),
          //         label: local.favorite,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: SvgPicture.asset(
          //           "assets/images/user.svg",
          //           fit: BoxFit.cover,
          //         ),
          //         activeIcon: SvgPicture.asset(
          //           "assets/images/user.svg",
          //           fit: BoxFit.cover,
          //           color: kMainColor,
          //         ),
          //         label: local.account,
          //       ),
          //     ],
          //     currentIndex: _selectedIndex,
          //     onTap: _onItemTapped,
          //     elevation: 4,
          //     backgroundColor: Colors.white,
          //     selectedItemColor: kMainColor,
          //     type: BottomNavigationBarType.shifting,
          //     showSelectedLabels: true,
          //   ),
          // ),

          ),
    );
  }

  AnimatedContainer navigationBar() {
    final originalHeight = MediaQuery.of(context).size.height;
    final topNotch = MediaQuery.of(context).padding.top;
    final bottomNotch = MediaQuery.of(context).padding.bottom;
    // final height = originalHeight - topNotch - bottomNotch;
    // print(originalHeight);
    // print(topNotch);
    // print(bottomNotch);
    // print(height);
    final height = MediaQuery.of(context).size.height;
    final navHeight = (70 / heightRatio) * height;
    return AnimatedContainer(
      height: navHeight,
      padding: EdgeInsets.only(bottom: bottomNotch / 2),
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < navBtn.length; i++)
            InkWell(
              onTap: () => setState(() => _selectedIndex = i),
              child: Container(
                alignment: Alignment.center,
                // color: Colors.white,
                child: iconBtn(i),
              ),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = _selectedIndex == i ? true : false;
    var height = isActive ? 14.0 : 0.0;
    var width = isActive ? 40.0 : 0.0;
    return SizedBox(
      width: 75.0,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Positioned(
              top: isActive ? 8 : 10,
              right: 0,
              left: 0,
              child: SvgPicture.asset(
                navBtn[i].imagePath,
                color: isActive ? kMainColor : kMain2Color,
                // scale: 2,
              ),
            ),
          ),
          isActive
              ? Container()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        navBtn[i].name,
                        style: bntText.copyWith(color: kMain2Color),
                      ),
                    ],
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
