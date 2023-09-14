import 'package:flutter/material.dart';
import 'package:ouft/screens/auth%20screens/login_screen.dart';
import 'package:ouft/screens/auth%20screens/sign_up_screen.dart';
import '../../helpers/dimintions.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final contentHeight = (497 / heightRatio) * height;
    final contentWidth = (335 / widthRatio) * width;
    final logoHeight = (258 / heightRatio) * height;
    final logoWidth = (268 / widthRatio) * width;
    final txtHeight = (38 / heightRatio) * height;
    final txtWidth = (260 / widthRatio) * width;
    final buttonHeight = (56 / heightRatio) * height;
    final buttonWidth = (335 / widthRatio) * width;
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/backgroungSplash.png"),
              colorFilter:
                  ColorFilter.mode(Colors.white70, BlendMode.colorBurn),
              fit: BoxFit.contain,
            )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(310.0, 30.0, 0, 0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Gotham'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/logoText.png",
                    scale: 5,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 230,
                  child: Text(
                    "The Only Fashion App You Need",
                    style: TextStyle(fontFamily: 'GothamBook', fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 312,
                  height: 41,
                  decoration: BoxDecoration(
                    border: Border.all(width: .5),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Row(children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image(
                        image: AssetImage("assets/images/google.png"),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Continue With Google",
                        style: TextStyle(
                            fontFamily: 'GothamBook',
                            fontSize: 13,
                            color: Colors.black),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 312,
                  height: 41,
                  decoration: BoxDecoration(
                    border: Border.all(width: .5),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    child: Row(children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image(
                        image: AssetImage("assets/images/facebook.png"),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Text(
                        "Continue With Facebook",
                        style: TextStyle(
                            fontFamily: 'GothamBook',
                            fontSize: 13,
                            color: Colors.black),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 312,
                  height: 41,
                  decoration: BoxDecoration(
                    border: Border.all(width: .5),
                  ),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SignUpScreen(),
                        ),
                      );
                    },
                    child: Row(children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image(
                        image: AssetImage("assets/images/gmail.png"),
                        width: 25,
                        height: 25,
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Text(
                        "Signup With Email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'GothamBook',
                            fontSize: 13,
                            color: Colors.black),
                      )
                    ]),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontFamily: 'GothamBook',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " login",
                          style: TextStyle(
                              fontFamily: 'GothamBook',
                              fontSize: 16,
                              color: Color(0xFF0075FF)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
