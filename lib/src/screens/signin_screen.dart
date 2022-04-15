import 'package:chat_app/src/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../components/continue_button.dart';
import '../components/textfield.dart';
import 'chat_screen.dart';
import '../mixin/validation_mixin.dart';

class SigninScreen extends StatefulWidget {
  final Function() keepLoggedin;
  static const id = 'signin_screen';
  const SigninScreen({
    Key? key,
    required this.keepLoggedin,
  }) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> with ValdiationMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final storage = FlutterSecureStorage();
  // late final String _email;
  // late final String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void authenticateExistingUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      await storage.write(key: 'uid', value: userCredential.user?.uid);
      Navigator.pushNamed(context, ChatScreen.id);
    } on FirebaseAuthException catch (error) {
      String? errorMessage = error.message;
      final snackBar = SnackBar(content: Text(errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void validate() async {
    if (_formKey.currentState!.validate()) {
      authenticateExistingUser();
      widget.keepLoggedin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 0),
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
                validator: validateEmail,
              ),
              textField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                icon: const Icon(Icons.lock),
                inputType: TextInputType.text,
                validator: validatePassword,
              ),
              ContinueButton(
                autheticate: validate,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                        _formKey.currentState!.reset();
                      },
                      child: const Text(
                        'Sign up',
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
