import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function() autheticate;
  const ContinueButton({
    Key? key, required this.autheticate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: autheticate,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFF0040FD),
          ),
          child: const Center(
            child: Text(
              'Continue',
              style: TextStyle(
                letterSpacing: 0.9,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
