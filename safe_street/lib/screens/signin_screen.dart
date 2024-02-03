import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_street/screens/bottom_appbar.dart';
import 'package:safe_street/screens/registration_splash_screen.dart';
import 'package:safe_street/utilities/Color.dart';
import 'package:safe_street/utilities/database_functions.dart';
import 'package:safe_street/widget/custom_progress_indicator.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signin-screen';
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
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
                  height: MediaQuery.of(context).size.height * 0.03,
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 2)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                      Text("Remember Me",
                          style: GoogleFonts.nunito(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))
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
                                  CustomProgressIndicator().show(context);
                                  status = await signInUserToSafeStreet(
                                      _email.text, _password.text);
                                  CustomProgressIndicator().dismiss();
                                  if (status == -1) {
                                    Fluttertoast.showToast(
                                        msg: "User Not Found");
                                  }
                                  if (status == -2) {
                                    Fluttertoast.showToast(
                                        msg: "Invalid Credentials");
                                  }
                                  if (status == -3) {
                                    Fluttertoast.showToast(
                                        msg: "Technical Error");
                                  }
                                  if (status == 0) {
                                    Fluttertoast.showToast(
                                        msg: "Successfully Logged In");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomBottomAppBar(),
                                        ));
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
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.025,
                // ),
                // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //   SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.4,
                //     child: Divider(
                //       color: Colors.grey[400],
                //       thickness: 1,
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Container(
                //       color: Colors.white,
                //       child: Text("OR",
                //           style: GoogleFonts.nunito(
                //             color: Colors.grey[400],
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //           )),
                //     ),
                //   ),
                //   SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.4,
                //     child: Divider(
                //       color: Colors.grey[400],
                //       thickness: 1,
                //     ),
                //   ),
                // ]),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.025,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.8,
                //         height: MediaQuery.of(context).size.height * 0.07,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor:
                //                   Colors.white, // background (button) color
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15))),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.network(
                //                   'http://pngimg.com/uploads/google/google_PNG19635.png',
                //                   fit: BoxFit.cover),
                //               Text(
                //                 "Continue with Google",
                //                 style: GoogleFonts.nunito(
                //                     color: Colors.black,
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ],
                //           ),
                //           onPressed: () async {
                //             // int status = await signInWithGoogle();
                //             int status = 0;
                //             if (status == -1) {
                //               Fluttertoast.showToast(
                //                   msg:
                //                       "Account exists with different credential");
                //             } else if (status == -2) {
                //               Fluttertoast.showToast(
                //                   msg: "Invalid Credentials");
                //             } else if (status == -3) {
                //               Fluttertoast.showToast(msg: "Technical Error");
                //             } else if (status == 0) {
                //               Fluttertoast.showToast(
                //                   msg: "Successfully Logged In");
                //               // Navigator.push(
                //               //     context,
                //               //     MaterialPageRoute(
                //               //       builder: (context) => MainBottomBar(),
                //               //     ));
                //             } else {}
                //           },
                //         )),
                //   ],
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: GoogleFonts.nunito(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegistrationSplashScreen.routeName);
                      },
                      child: Text(
                        "Sign Up",
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
