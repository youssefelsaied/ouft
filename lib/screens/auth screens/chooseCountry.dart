import 'package:flutter/material.dart';
import 'package:ouft/screens/auth%20screens/choose_auth_screen.dart';

class chooseCountry extends StatefulWidget {
  const chooseCountry({super.key});

  @override
  State<chooseCountry> createState() => _chooseCountryState();
}

List<String> countries = [
  'Egypt',
  'UAE',
  'UK',
];

Map<String, String> countryFlags = {
  'Egypt': 'assets/images/Flag_of_Egypt.png',
  'UAE': 'assets/images/UAE flag.png',
  'UK': 'assets/images/UK.png',
};

class _chooseCountryState extends State<chooseCountry> {
  String selectedCountry = 'Egypt';
  bool isDropdownOpened = false;

  void _showCountryAlert(String country, Map countryFlags) {
    if (country == "UAE" || country == "UK") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: 308,
                height: 173,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      countryFlags[country]!,
                      width: 27,
                      height: 19,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 210,
                      child: Text(
                        "We Are Coming To $country Soon. Stay Tuned!",
                        style:
                            TextStyle(fontFamily: 'GothamBook', fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 184,
                      height: 35,
                      color: Color(0xFF33BBC5),
                      child: RawMaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontFamily: 'GothamBook',
                                fontSize: 14,
                                color: Colors.white),
                          )),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Text('OK'),
                    // ),
                  ],
                )),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: Image.asset(
              "assets/images/choose_country_bg.png",
              // color: Colors.white,
            ),
          ),
          Container(
              alignment: Alignment.center,
              color: Colors.white70,
              // height: double.infinity,
              // width: double.infinity,
              // constraints: BoxConstraints.expand(),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage("assets/images/choose_country_bg.png"),
              //   fit: BoxFit.fill,
              // )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Image.asset(
                      "assets/images/logoText.png",
                      scale: 4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 230,
                      child: Text(
                        "The Only Fashion App You Need",
                        style:
                            TextStyle(fontFamily: 'GothamBook', fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Select Your Country",
                      style: TextStyle(fontFamily: 'GothamBook', fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpened = !isDropdownOpened;
                        });
                      },
                      child: Container(
                        width: 312,
                        height: 42,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isDropdownOpened
                                ? Colors.transparent
                                : Colors.grey,
                            width: .3,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  countryFlags[selectedCountry]!,
                                  width: 27,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(selectedCountry),
                              ],
                            ),
                            Icon(
                              isDropdownOpened
                                  ? Icons.expand_more
                                  : Icons.keyboard_arrow_up,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isDropdownOpened)
                      Container(
                        width: 312,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            final country = countries[index];
                            return Column(
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Divider(
                                    thickness: 1,
                                    color: Color.fromARGB(122, 0, 0, 0),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCountry = country;
                                      isDropdownOpened = false;
                                    });
                                    _showCountryAlert(country, countryFlags);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: 312,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Image.asset(
                                              countryFlags[country]!,
                                              width: 27,
                                              height: 18,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              country,
                                              style: TextStyle(
                                                  fontFamily: 'GothamBook',
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        if (country == selectedCountry)
                                          Icon(Icons.done,
                                              color: Color(0xFF0075FF)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    SizedBox(
                      height: 300,
                    ),
                    Container(
                      width: 312,
                      height: 45,
                      color: Color(0xFF33BBC5),
                      child: RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseAuthScreen()));
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontFamily: 'GothamBook',
                                fontSize: 16,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
