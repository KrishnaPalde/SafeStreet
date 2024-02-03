import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safe_street/firebase_options.dart';
import 'package:safe_street/screens/bottom_appbar.dart';
import 'package:safe_street/screens/home_screen.dart';
import 'package:safe_street/screens/registration_splash_screen.dart';
import 'package:safe_street/screens/signin_screen.dart';
import 'package:safe_street/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isUserLoggedIn;
  if (FirebaseAuth.instance.currentUser != null) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
  runApp(MyApp(isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  MyApp(this.isUser, {super.key});

  bool isUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Street',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isUser ? CustomBottomAppBar() : SignInScreen(),
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        RegistrationSplashScreen.routeName: (context) =>
            RegistrationSplashScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
      },
    );
  }
}
