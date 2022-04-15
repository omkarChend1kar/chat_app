import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.icon,
    required this.inputType, required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final Widget icon;
  final TextInputType inputType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        child: TextFormField(
          keyboardType: inputType,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: icon,
            focusedErrorBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
