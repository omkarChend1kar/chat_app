import 'package:chat_app/src/screens/login_screen.dart';
import 'package:chat_app/src/screens/register_screen.dart';
import 'package:chat_app/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

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
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id:(context) => const LoginScreen(),
        RegisterScreen.id:(context) => const RegisterScreen(),
      },
    );
  }
}