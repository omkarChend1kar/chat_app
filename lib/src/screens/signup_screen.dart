import 'package:chat_app/src/screens/chat_screen.dart';
import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/continue_button.dart';
import '../components/textfield.dart';

class SignupScreen extends StatefulWidget {
  static const id = 'signup_screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void createNewUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushNamed(context, ChatScreen.id);
      // ignore: empty_catches
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 0),
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
            textField(
              controller: _emailController,
              labelText: 'Email ID',
              obscureText: false,
              icon: const Icon(Icons.email),
              inputType: TextInputType.emailAddress,
            ),
            textField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
              icon: const Icon(Icons.lock),
              inputType: TextInputType.text,
            ),
            ContinueButton(
              autheticate: createNewUser,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
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
    );
  }
}
