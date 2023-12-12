import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  // ignore: use_super_parameters
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 243, 110, 33),
              borderRadius: BorderRadius.circular(8),
            ),
            // ignore: prefer_const_constructors
            child: Center(
              // ignore: prefer_const_constructors
              child: Text(
                'PROMOFIT',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
