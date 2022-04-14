import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/additional_signin_provider.dart';
import '../components/continue_button.dart';
import '../components/number_field.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              ContinueButton(autheticate: () {},),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    AdditionalSigninProvider(assetName: 'assets/images/google.svg',),
                    AdditionalSigninProvider(assetName: 'assets/images/facebook.svg'),
                    AdditionalSigninProvider(assetName: 'assets/images/twitter.svg'),
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

