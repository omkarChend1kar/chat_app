import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionalSigninProvider extends StatelessWidget {
  const AdditionalSigninProvider({
    Key? key,
    required this.assetName,
    required this.signin,
  }) : super(key: key);

  final String assetName;
  final Function() signin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: signin,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(assetName),
        ),
      ),
    );
  }
}

