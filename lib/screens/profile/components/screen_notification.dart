import 'package:flutter/material.dart';

class ScreenNotification extends StatelessWidget {
  static const String routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: ListView.builder(
        itemCount: 10, // Número de notificações (substitua por sua lógica de notificações)
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.notifications), // Ícone de notificação
            title: Text('Notificação $index'),
            subtitle: Text('Descrição da notificação $index'),
            onTap: () {
              // Implemente a lógica para quando a notificação for clicada
              // Por exemplo, abrir mais detalhes da notificação, etc.
              // Pode redirecionar para outra tela ou realizar ação desejada.
              // Este exemplo apenas exibe um Snackbar para fins de demonstração:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Notificação $index clicada'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
