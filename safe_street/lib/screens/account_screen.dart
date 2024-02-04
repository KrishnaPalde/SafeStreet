import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_street/screens/signin_screen.dart';

class AccountSettingScreen extends StatelessWidget {
  AccountSettingScreen({super.key});
  static const String routename = "/account-settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://img.icons8.com/color/96/person-female.png")),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green.shade100),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        // Navigator.pushReplacementNamed(
                        //     context, LoginScreen.routename);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          child: Image.network(
                              'https://img.icons8.com/windows/64/exit.png'),
                        ),
                      ),
                      title: Text(
                        "Your Scores",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.green.shade400),
                      ),
                      subtitle: Text(
                        "All Scores History",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.green.shade300),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow.shade100),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        // Navigator.pushReplacementNamed(
                        //     context, LoginScreen.routename);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          child: Image.network(
                              'https://img.icons8.com/windows/64/exit.png'),
                        ),
                      ),
                      title: Text(
                        "Your Experiences",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.grey.shade900),
                      ),
                      subtitle: Text(
                        "All Experience History",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue.shade100),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        // Navigator.pushReplacementNamed(
                        //     context, LoginScreen.routename);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          child: Image.network(
                              'https://img.icons8.com/windows/64/exit.png'),
                        ),
                      ),
                      title: Text(
                        "FAQ",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.blue.shade400),
                      ),
                      subtitle: Text(
                        "Frequently Asked Questions",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.blue.shade300),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        // Navigator.pushReplacementNamed(
                        //     context, LoginScreen.routename);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          child: Image.network(
                              'https://img.icons8.com/windows/64/exit.png'),
                        ),
                      ),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.grey.shade400),
                      ),
                      subtitle: Text(
                        "Customize the App",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
              ),

              // First List Tile
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red.shade100),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            SignInScreen.routeName, (route) => false);
                        // Navigator.pushReplacementNamed(
                        //     context, LoginScreen.routename);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.09,
                          child: Image.network(
                              'https://img.icons8.com/windows/64/exit.png'),
                        ),
                      ),
                      title: Text(
                        "Log out",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.red.shade400),
                      ),
                      subtitle: Text(
                        "Exit the Application",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.red.shade300),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
