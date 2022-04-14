import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Mobile number',
          hintText: '',
          prefixIcon: const Icon(Icons.phone),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF0040FD),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF0040FD),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
