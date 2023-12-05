import 'package:flutter/material.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SectionTitle(
            title: "Marcas Populares",
            press: () {
              // Opcional: Adicione ação ao título se necessário
            },
          ),
        ),
        SizedBox(
          height: 300, // Altura total da grade
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 2, // Define o número de colunas
              mainAxisSpacing: 10.0, // Espaçamento vertical entre os cartões
              crossAxisSpacing: 10.0, // Espaçamento horizontal entre os cartões
              children: [
                buildCard(
                  image: 'assets/images/logo1.png', // Caminho da imagem
                ),
                buildCard(
                  image: 'assets/images/logo2.png', // Caminho da imagem
                ),
                buildCard(
                  image: 'assets/images/logo3.png', // Caminho da imagem
                ),
                buildCard(
                  image: 'assets/images/logo4.png', // Caminho da imagem
                ),
                buildCard(
                  image: 'assets/images/logo5.png', // Caminho da imagem
                ),
                buildCard(
                  image: 'assets/images/logo6.png', // Caminho da imagem
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard({required String image}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
