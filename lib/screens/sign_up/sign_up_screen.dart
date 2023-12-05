import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/sign_up_form.dart';

//package firebase


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fazer Cadastro"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text("💪Cadastro💪", style: headingStyle),
                  const Text(
                    "Preencha com seus dados",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
