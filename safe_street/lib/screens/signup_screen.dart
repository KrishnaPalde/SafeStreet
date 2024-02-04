import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_street/screens/bottom_appbar.dart';
import 'package:safe_street/screens/signin_screen.dart';
import 'package:safe_street/utilities/Color.dart';
import 'package:safe_street/utilities/database_functions.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/singup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _adhaarNumber = TextEditingController();

  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/safestreet_logo.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0),
                //   child: Container(
                //     child: Text(
                //       "Sign Up",
                //       style: GoogleFonts.nunito(
                //           color: Colors.black,
                //           fontSize: 24,
                //           fontWeight: FontWeight.w800),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.alternate_email_rounded,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email ID',
                                hintStyle: GoogleFonts.nunito(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MaterialColor(0xFFFD3013, color),
                                        width: 3)),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _fullName,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: GoogleFonts.nunito(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MaterialColor(0xFFFD3013, color),
                                        width: 3)),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 3),
                          child: Image.network(
                            'https://img.icons8.com/windows/64/BDBDBD/lock-2--v1.png',
                            scale: 2.2,
                          )
                          // Image.asset('/assets/images/PasswordIcon.jpg')
                          ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: GoogleFonts.nunito(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MaterialColor(0xFFFD3013, color),
                                        width: 3)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 3),
                          child: Image.network(
                            'https://img.icons8.com/windows/64/BDBDBD/lock-2--v1.png',
                            scale: 2.2,
                          )
                          // Image.asset('/assets/images/PasswordIcon.jpg')
                          ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _cpassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: GoogleFonts.nunito(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MaterialColor(0xFFFD3013, color),
                                        width: 3)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 3),
                          child: Image.network(
                            'https://img.icons8.com/material-outlined/24/BDBDBD/identification-documents.png',
                            scale: 1,
                          )
                          // Image.asset('/assets/images/PasswordIcon.jpg')
                          ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextField(
                            controller: _adhaarNumber,
                            decoration: InputDecoration(
                                hintText: 'Adhaar Number',
                                hintStyle: GoogleFonts.nunito(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MaterialColor(0xFFFD3013, color),
                                        width: 3)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          activeColor: MaterialColor(0xFFFD3013, color),
                          value: _isRememberMe,
                          onChanged: (val) {
                            setState(() {
                              _isRememberMe = val!;
                            });
                          }),
                      Flexible(
                        child: Text(
                            "By signing up you agree to our Terms & Conditions and Privacy Policy",
                            style: GoogleFonts.nunito(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            onPressed: () async {
                              int status;
                              if (_email.text.isNotEmpty) {
                                if (_password.text.isNotEmpty) {
                                  if (_adhaarNumber.text.length == 12) {
                                    if (_password.text.toString() ==
                                        _cpassword.text.toString()) {
                                      status =
                                          await createAccountWithSafeStreet(
                                              _email.text.toString(),
                                              _password.text.toString(),
                                              _fullName.text.toString(),
                                              _adhaarNumber.text.toString());
                                    } else {
                                      status = -4;
                                    }
                                    if (status == -1) {
                                      Fluttertoast.showToast(
                                          msg: "Weak password");
                                    }
                                    if (status == -2) {
                                      Fluttertoast.showToast(
                                          msg: "Email is already in use");
                                    }
                                    if (status == -3) {
                                      Fluttertoast.showToast(
                                          msg: "Technical Error");
                                    }
                                    if (status == -4) {
                                      Fluttertoast.showToast(
                                          msg: "Password Does not match");
                                    }
                                    if (status == 0) {
                                      Fluttertoast.showToast(
                                          msg: "Successfully Sign In");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CustomBottomAppBar(),
                                          ));
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Invalid Adhaar Number");
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Password Cannot Be Empty");
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Email Cannot Be Empty");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: MaterialColor(0xFFFD3013,
                                  color), // Set your desired background color
                            ),
                            child: Text(
                              "Continue",
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: GoogleFonts.nunito(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignInScreen.routeName);
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
