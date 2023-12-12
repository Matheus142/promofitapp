// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import '../../../constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 50), // Espaço superior
        Text(
          "PROMOFIT",
          style: TextStyle(
            fontSize: 32,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20), // Espaço entre o texto "PROMOFIT" e o texto do widget
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50), // Espaço entre o texto e a imagem
        Expanded(
          child: Image.asset(
            image!,
            height: 265,
            width: 235,
          ),
        ),
      ],
    );
  }
}
