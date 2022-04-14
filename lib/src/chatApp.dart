import 'package:chat_app/src/screens/welcome_screen.dart';
import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:chat_app/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';

class chatApp extends StatelessWidget {
  const chatApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0040FD),
          secondary: const Color(0xFFFFFFFF),
        )
      ),
      // home:LoginScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context) => const WelcomeScreen(),
        SigninScreen.id:(context) => const SigninScreen(),
        SignupScreen.id:(context) => const SignupScreen(),
        ChatScreen.id:(context) => const ChatScreen(),
      },
    );
  }
}