import 'package:flutter/material.dart';

class TelaConclusaoCurso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conclusão de Curso'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Esse Trabalho de conclusão de curso foi realizado pelo aluno Matheus Willian Nunes Ferreira, onde o mesmo teve muitas noites em claro e café tomados, logo ele conta com a aprovação da banca e dos demais alunos que já apresentaram ou irão apresentar, fazendo um ótimo ciclo estudantil ser encerrado com chave de ouro.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
