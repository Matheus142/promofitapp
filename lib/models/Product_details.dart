import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsDetailsPage extends StatelessWidget {
  static const String routeName = '/products_details';

  @override
  Widget build(BuildContext context) {
    String productImageUrl = "assets/images/wheyfrente.png";
    String productDescription = "Descrição do Produto";
    String amazonProductUrl =
        "https://www.amazon.com.br/Max-Titanium-Forma%C3%A7%C3%A3o-Quantidade-Amino%C3%A1cidos/dp/B0BHFGGHDP/ref=asc_df_B0BHFGGHDP/?tag=googleshopp00-20&linkCode=df0&hvadid=405196231621&hvpos=&hvnetw=g&hvrand=13577095741229434362&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9102338&hvtargid=pla-2015859784508&mcid=9785574c13ea31f1bdc4f31ea5c6c7a3&th=17";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullScreenImage(imageUrl: productImageUrl),
                    ),
                  );
                },
                child: Hero(
                  tag: 'product_image',
                  child: Card(
                    elevation: 3.0,
                    child: Image.asset(
                      productImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Description icon
            GestureDetector(
              onTap: () {
                // Add your description logic here
                print('Description tapped');
              },
              child: const Icon(Icons.description),
            ),
            const SizedBox(height: 16),
            // Validate offer button
            ElevatedButton(
              onPressed: () async {
                if (await canLaunch(amazonProductUrl)) {
                  await launch(amazonProductUrl);
                } else {
                  throw 'Could not launch $amazonProductUrl';
                }
              },
              child: const Text('Eu quero validar a oferta'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'product_image',
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
