import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'package:shop_app/screens/profile/Myprofile.dart'; // Importe a tela MyProfileScreen

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil do usuário",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Remover a seta de volta
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Minha Conta",
              icon: "assets/icons/User Icon.svg",
              press: () {
                Navigator.pushNamed(context, MyProfileScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Sair",
              icon: "assets/icons/Log out.svg",
              press: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Sair"),
                      content: const Text("Tem certeza de que deseja sair?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: const Text("Sair"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
