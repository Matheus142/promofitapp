import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProductsDetailsPage extends StatefulWidget {
  static const String routeName = '/products_details';

  List<String> productImages = [
    "assets/images/wheyfrente.png",
    "assets/images/wheycosta.png",
    "assets/images/wheytabela.png",
  ];

  String productDescription = "Whey Max titaniun de R\$105 por R\$95";

  @override
  // ignore: library_private_types_in_public_api
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
    const url = 'https://l1nk.dev/ykR8F';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Detalhes do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            FullScreenImage(imageUrl: selectedImage),
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
              // ignore: prefer_const_constructors
              SizedBox(height: 16),
              SizedBox(
                height: 120, // Altura do espaço da ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImage = widget.productImages[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
              SizedBox(height: 16),
              Text(
                'Descrição da Oferta:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _launchURL(); // Chama a função para abrir o link
                },
                child: Text('Eu quero validar a oferta'),
              ),
              SizedBox(height: 16),
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
