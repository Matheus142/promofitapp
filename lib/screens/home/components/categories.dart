import 'package:flutter/material.dart';
import '../../products/product_whey.dart';

class Categories extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          // ignore: prefer_const_constructors
          child: SizedBox(
            height: 50,
            // ignore: prefer_const_constructors
            child: Align(
              alignment: Alignment.centerLeft,
              // ignore: prefer_const_constructors
              child: Text(
                'Todas as Categorias',
                // ignore: prefer_const_constructors
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

// ignore: use_key_in_widget_constructors
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
                    // ignore: prefer_const_constructors
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    backgroundImage: AssetImage(imagePath ?? ''),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 8),
                  Text(
                    categoryName,
                    // ignore: prefer_const_constructors
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
