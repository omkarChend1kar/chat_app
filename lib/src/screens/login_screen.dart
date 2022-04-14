import 'dart:ui';

import 'package:chat_app/src/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_rounded,
                      size: 40,
                      color: Color(0xFF0040FD),
                    ),
                    Text(
                      'ChatApp',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFF0040FD),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                child: emailField(),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              //   child: passwordField(),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Material(
                  color: const Color(0xFF0040FD),
                  borderRadius: BorderRadius.circular(5),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: double.infinity,
                    height: 25,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'or signin with',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: loginBoxes('G')),
                    Expanded(child: loginBoxes('F')),
                    Expanded(child: loginBoxes('A')),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF0040FD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginBoxes(String loginWith) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0.5,
      child: MaterialButton(
        onPressed: () {},
        minWidth: 90,
        height: 90,
        child: Text(loginWith),
      ),
    );
  }

  Widget emailField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Mobile number',
        hintText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:Color(0xFF0040FD),
            width:1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color:Color(0xFF0040FD),
            width:1,
          ),
        ),
      ),
    );
  }

  // Widget passwordField() {
  //   return const TextField(
  //     decoration: InputDecoration(
  //       labelText: 'Password',
  //       hintText: '',
  //     ),
  //   );
  // }
}
