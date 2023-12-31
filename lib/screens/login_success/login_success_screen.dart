// ignore_for_file: unused_field, prefer_const_constructors, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/screens/init_screen.dart';

class LoginSuccessScreen extends StatefulWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  _LoginSuccessScreenState createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 6000), // Define a duração da animação
    );

    _opacityAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Define a curva de animação suave
      ),
    );

    _animationController.forward(); // Inicia a animação quando a tela é exibida
  }

  @override
  void dispose() {
    _animationController.dispose(); // Libera recursos do AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Sucesso no Login!"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Lottie.asset(
            'assets/images/Animation.json',
            height: MediaQuery.of(context).size.height * 0.4,
            animate: true,
            controller: _animationController, // Usa o AnimationController
          ),
          const SizedBox(height: 16),
          const Text(
            "Login Efetuado",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                _animationController.reset(); // Reinicia a animação
                Navigator.pushNamed(context, InitScreen.routeName);
              },
              child: const Text("De volta ao Menu"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
