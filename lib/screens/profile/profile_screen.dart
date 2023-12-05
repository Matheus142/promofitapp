import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
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
                // Implemente a lógica desejada para 'Minha Conta'
              },
            ),
            ProfileMenu(
              text: "Notificações",
              icon: "assets/icons/Bell.svg",
              press: () {
                // Implemente a lógica desejada para 'Notificações'
              },
            ),
            ProfileMenu(
              text: "Configurações",
              icon: "assets/icons/Settings.svg",
              press: () {
                // Implemente a lógica desejada para 'Configurações'
              },
            ),
            ProfileMenu(
              text: "Sobre o Aplicativo",
              icon: "assets/icons/Question mark.svg",
              press: () {
                // Implemente a lógica desejada para 'Sobre o Aplicativo'
              },
            ),
            ProfileMenu(
              text: "Sair",
              icon: "assets/icons/Log out.svg",
              press: () {
                // Encerra o aplicativo quando pressionado
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
