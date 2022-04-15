import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:chat_app/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../components/additional_signin_provider.dart';
import '../components/continue_button.dart';
import '../components/number_field.dart';
import '../services/authenticator.dart';

class WelcomeScreen extends StatelessWidget {
  // final Function() signIn;
  static const id = 'welcome_screen';
  bool gotoSignin = false;
  bool gotoSignup = false;
  WelcomeScreen({
    Key? key,
    // required this.signIn,
  }) : super(key: key);

  AuthClass authclass = AuthClass();
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
                  children: const [
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
              const NumberField(),
              ContinueButton(
                autheticate: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'or signin with',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalSigninProvider(
                      assetName: 'assets/images/google.svg',
                      signin: () async {
                        await authclass.googleSignIn(context);
                      },
                    ),
                    AdditionalSigninProvider(
                      assetName: 'assets/images/facebook.svg',
                      signin: () {},
                    ),
                    AdditionalSigninProvider(
                      assetName: 'assets/images/twitter.svg',
                      signin: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SigninScreen.id);
                      },
                      child: const Text(
                        'Sign in',
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
}
