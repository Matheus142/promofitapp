// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_declarations, duplicate_ignore, library_private_types_in_public_api, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsDetailsPage extends StatefulWidget {
  static const String routeName = '/products_details';

  List<String> productImages = [
    // Adicione os caminhos das suas imagens aqui
    "assets/images/wheyfrente.png",
    "assets/images/wheycosta.png",
    "assets/images/wheytabela.png",
  ];

  String productDescription = "Whey Max Titanium de R\$189.90 por R\$130.50 (OBS: preços podem sofrer alteração)";

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

  Future<String> _createBitlyDynamicLink() async {
    final String accessToken = 'bc0432e138fab71c60bb9d30830bfcb1d93e1b8d';
    // ignore: prefer_const_declarations
    final String amazonLink = 'https://www.maxtitanium.com.br/100-whey-pote-900g/p?idsku=116&utm_source=google&utm_campaign=shopping&utm_medium=cpc&utm_source=v4google&utm_medium=pmax&utm_campaign=[V4][MO][PMA][GOO][GO]+Termogenicos-16275184680&utm_content=PMAX-&utm_term=&adid=&gad_source=1&gclid=CjwKCAiApuCrBhAuEiwA8VJ6Jkqbaiy88iOzrOT-hvBXXTmGQaO1lQ9ZQN2nS3LeTub5Bmi_vm0rdBoCs4MQAvD_BwE';

    final response = await http.post(
      Uri.parse('https://api-ssl.bitly.com/v4/shorten'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'long_url': amazonLink,
        'domain': 'bit.ly',
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['link'];
    } else {
      print('Erro ao criar o link dinâmico no Bitly: ${response.statusCode}');
      print('Resposta do servidor: ${response.body}');
      throw 'Erro ao criar o link dinâmico no Bitly';
    }
  }

  Future<void> _openBitlyDynamicLink() async {
    try {
      final String dynamicLink = await _createBitlyDynamicLink();
      if (dynamicLink.isNotEmpty) {
        if (await canLaunch(dynamicLink)) {
          await launch(dynamicLink);
        } else {
          throw 'Could not launch $dynamicLink';
        }
      } else {
        throw 'Empty dynamic link';
      }
    } catch (e) {
      print('Erro ao abrir o link: $e');
      // Adicione aqui um código para lidar com o erro ao abrir o link dinâmico
    }
  }

  void _showImageFullScreen(String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(imageUrl: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              onTap: () {
                _showImageFullScreen(selectedImage);
              },
              child: Hero(
                tag: 'product_image',
                child: Image.asset(
                  selectedImage,
                  fit: BoxFit.cover,
                  height: 200, // Altura ajustada para a visualização adequada
                ),
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
              onPressed: _openBitlyDynamicLink,
              child: Text('Clique para validar a oferta'),
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
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
