import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex:2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: loginBoxes('G')),
                    Expanded(child: loginBoxes('F')),
                    Expanded(child: loginBoxes('A')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'or, register with email...',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: nameField(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: emailField(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: passwordField(),
              ),
            ),
            // SizedBox(
            //   height: 100,
            // )
          ],
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

  Widget nameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Full name',
      ),
    );
  }

  Widget emailField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email ID',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}
