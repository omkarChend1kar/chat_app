import 'package:chat_app/src/screens/chat_screen.dart';
import 'package:chat_app/src/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/continue_button.dart';
import '../components/textfield.dart';
import '../mixin/validation_mixin.dart';

class SignupScreen extends StatefulWidget {
  final Function() keepLoggedin;
  static const id = 'signup_screen';
  const SignupScreen({
    Key? key,
    required this.keepLoggedin,
    // required this.signIn,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with ValdiationMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final String _email;
  late final String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void createNewUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushNamed(context, ChatScreen.id);
    } on FirebaseAuthException catch (error) {
      String? errorMessage = error.message;
      final snackBar = SnackBar(content: Text(errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void validate() async {
    if (_formKey.currentState!.validate()) {
      createNewUser();
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
                autheticate: () async {
                  if (_formKey.currentState!.validate()) {
                    createNewUser();
                  }
                },
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
                        _formKey.currentState!.reset();
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
