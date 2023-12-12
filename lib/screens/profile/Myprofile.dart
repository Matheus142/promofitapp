// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfileScreen extends StatelessWidget {
  static const String routeName = "/my_profile";

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String email = user?.email ?? "Email não encontrado";
    bool hasPassword = user?.providerData.any((userInfo) => userInfo.providerId == "password") ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Email: $email",
              style: Theme.of(context).textTheme.headline6, // Utilizando o estilo da AppBar
            ),
            SizedBox(height: 20),
            Text(
              "Senha autenticada: ${hasPassword ? 'Sim' : 'Não'}",
              style: Theme.of(context).textTheme.headline6, // Utilizando o estilo da AppBar
            ),
          ],
        ),
      ),
    );
  }
}
