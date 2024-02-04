import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_text_fields/material_text_fields.dart';
import 'package:safe_street/screens/signup_screen.dart';
import 'package:safe_street/utilities/static_data.dart';

class RegistrationSplashScreen extends StatefulWidget {
  RegistrationSplashScreen({super.key});
  static const routeName = '/registration-splash-screen';

  @override
  State<RegistrationSplashScreen> createState() =>
      _RegistrationSplashScreenState();
}

class _RegistrationSplashScreenState extends State<RegistrationSplashScreen> {
  bool isCountry = true;

  bool isCity = false;

  bool isRegister = false;

  @override
  void initState() {
    StaticData.selectedCity.clear();
    StaticData.selectedCountry = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
              ),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/safestreet_logo.png'),
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  isCountry && !isCity
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.8,
                            child: DropdownButtonFormField(
                              items: StaticData.generateCountryDropdownItems(),
                              focusColor: Colors.white,
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              hint: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Country",
                                ),
                              ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Country",
                                // contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              icon: SizedBox.shrink(),
                              alignment: Alignment.center,
                              onChanged: (value) {
                                print(value);
                                StaticData.selectedCountry = value.toString();
                                setState(() {
                                  isCity = true;
                                });
                              },
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50, // Adjust the height as needed
                            child: TextField(
                              keyboardType: TextInputType.text,
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                hintText: 'City',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    right: 12), // Adjust as needed
                              ),
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.done,
                              controller: StaticData.selectedCity,
                              onSubmitted: (a) {
                                print(a);
                                Navigator.of(context).pushReplacementNamed(
                                    SignUpScreen.routeName);
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
