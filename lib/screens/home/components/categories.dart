import 'package:flutter/material.dart';
import '../../products/product_whey.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Todas as Categorias',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: CustomListView(),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  final Map<String, String> categoryImages = {
    'Whey': 'assets/images/image_0.png',
    'Barrinhas': 'assets/images/image_1.png',
    'Caseína': 'assets/images/image_2.png',
    'BCAAs': 'assets/images/image_3.png',
    'Creatina': 'assets/images/image_4.png',
    'Omega-3': 'assets/images/image_5.png',
    'Pré-Treino': 'assets/images/image_6.png',
    'Colageno': 'assets/images/image_7.png',
    'Glutamina': 'assets/images/image_8.png',
    'Termogênicos': 'assets/images/image_9.png',
    'Multivitamínicos': 'assets/images/image_10.png',
  };

  final List<String> categories = [
    'Whey',
    'Barrinhas',
    'Caseína',
    'BCAAs',
    'Creatina',
    'Omega-3',
    'Pré-Treino',
    'Colageno',
    'Glutamina',
    'Termogênicos',
    'Multivitamínicos',
  ];

  void handleCategoryTap(BuildContext context, String categoryName) {
    if (categoryName == 'Whey') {
      Navigator.pushNamed(context, ProductWhey.routeName);
    }
    // Adicione mais ações conforme necessário para outros itens
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final categoryName = categories[index];
        final imagePath = categoryImages[categoryName];

        return GestureDetector(
          onTap: () => handleCategoryTap(context, categoryName),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => handleCategoryTap(context, categoryName),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    backgroundImage: AssetImage(imagePath ?? ''),
                  ),
                  SizedBox(height: 8),
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
