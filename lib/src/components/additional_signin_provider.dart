import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionalSigninProvider extends StatelessWidget {
  const AdditionalSigninProvider({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 0.1,
      child: MaterialButton(
        onPressed: () {},
        minWidth: 10,
        height: 10,
        child: SvgPicture.asset(
          assetName,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}