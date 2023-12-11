// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsDetailsPage extends StatefulWidget {
  static const String routeName = '/products_details';

  List<String> productImages = [
    "assets/images/wheyfrente.png",
    "assets/images/wheycosta.png",
    "assets/images/wheytabela.png",
  ];

  String productDescription = "Whey Max titaniun de R\$105 por R\$95";

  @override
  _ProductsDetailsPageState createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  String selectedImage = '';

  @override
  void initState() {
    super.initState();
    selectedImage = widget.productImages.first;
  }

 Future<void> _launchURL() async {
  const url = 'https://www.amazon.com.br/Max-Titanium-Forma%C3%A7%C3%A3o-Quantidade-Amino%C3%A1cidos/dp/B0BHFGGHDP/ref=asc_df_B0BHFGGHDP/?tag=googleshopp00-20&linkCode=df0&hvadid=405196231621&hvpos=&hvnetw=g&hvrand=13577095741229434362&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9102338&hvtargid=pla-2015859784508&mcid=9785574c13ea31f1bdc4f31ea5c6c7a3&th=17'; // Substitua com o seu URL real
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    // Handle error
    print(e);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                        builder: (_) => FullScreenImage(imageUrl: selectedImage),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'product_image',
                    child: Card(
                      elevation: 3.0,
                      child: Image.asset(
                        selectedImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage = widget.productImages[index];
                          });
                        },
                        child: Hero(
                          tag: 'product_image_$index',
                          child: Image.asset(
                            widget.productImages[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Descrição da Oferta:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  widget.productDescription,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text('Eu quero validar a oferta'),
              ),
              const SizedBox(height: 16),
            ],
          ),
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
