import 'package:flutter/material.dart';
import '../../components/no_account_text.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
  
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Entrar"),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 0), // Espaço adicional para mover o texto para cima
                const Text(
                  "💲Seja bem vindo!💲",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32), // Espaço adicional entre os textos
                const SignForm(),
                const SizedBox(height: 24), // Espaço adicional entre os campos de login e senha
                const SizedBox(height: 24),
                const NoAccountText(),
                const SizedBox(height: 100), // Espaço adicional no final da coluna
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}




