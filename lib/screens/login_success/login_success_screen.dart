import 'package:flutter/material.dart';
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
      duration: Duration(milliseconds: 500), // Define a duração da animação
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn, // Define a curva de animação desejada
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
      body: AnimatedOpacity(
        opacity: _opacityAnimation.value,
        duration: Duration(milliseconds: 500), // Define a duração da animação
        curve: Curves.easeIn, // Define a curva de animação desejada
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset(
              "assets/images/success.png",
              height: MediaQuery.of(context).size.height * 0.4, //40%
            ),
            const SizedBox(height: 16),
            const Text(
              "Sucesso no Login",
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
                  Navigator.pushNamed(context, InitScreen.routeName);
                },
                child: const Text("De volta ao Menu"),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
