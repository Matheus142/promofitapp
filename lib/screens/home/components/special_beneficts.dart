import 'package:flutter/material.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center, // Centraliza o texto
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: SectionTitle(
                title: "💊Suplementos e seus Benefícios💊",
                press: () {},
              ),
            ),
          ),
          SizedBox(height: 20),
          buildOfferList(context),
        ],
      ),
    );
  }

  Widget buildOfferList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildSpecialOfferCard(
            context,
            image: "assets/images/image_banner_02.png",
          ),
          buildSpecialOfferCard(
            context,
            image: "assets/images/image_banner_03.png",
          ),
          buildSpecialOfferCard(
            context,
            image: "assets/images/image_banner_04.png",
          ),
          buildSpecialOfferCard(
            context,
            image: "assets/images/image_banner_05.png",
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget buildSpecialOfferCard(BuildContext context, {required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen(image: image),
            ),
          );
        },
        child: SizedBox(
          width: 200,
          height: 200,
          child: Hero(
            tag: image,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  final String image;

  const ImageDetailScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: image,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
