import 'package:chat_app/src/screens/welcome_screen.dart';
import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:chat_app/src/screens/signup_screen.dart';
import 'package:chat_app/src/services/authenticator.dart';
import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';

class chatApp extends StatefulWidget {
  const chatApp({Key? key}) : super(key: key);

  @override
  State<chatApp> createState() => _chatAppState();
}

class _chatAppState extends State<chatApp> {
  bool isUserLoggedin = false;
  AuthClass authclass = AuthClass();
  @override
  void initState() {
    super.initState();
    checkGoogleLogin();
    // checkEmailLogin();
    // checkEmailLogout();
  }
  void checkGoogleLogin() async {
    String? token = await authclass.getToken();
    print(token);
    if (token != null) {
      setState(() {
        isUserLoggedin = true;
      });
    }
  }

  void checkEmailLogin() {
    setState(() {
      isUserLoggedin = true;
    });
  }

  void checkEmailLogout() {
    setState(() {
      isUserLoggedin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0040FD),
          secondary: const Color(0xFFFFFFFF),
        ),
      ),
      home: WelcomeScreen(),
      //     : ChatScreen(getLoggedOut: checkEmailLogout),
      // initialRoute: !isUserLoggedin ? WelcomeScreen.id : ChatScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SigninScreen.id: (context) =>
            SigninScreen(keepLoggedin: checkEmailLogin),
        SignupScreen.id: (context) =>
            SignupScreen(keepLoggedin: checkEmailLogin),
        ChatScreen.id: (context) => ChatScreen(
              getLoggedOut: checkEmailLogout,
            ),
      },
    );
  }
}
