import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late ImagePicker _imagePicker;
  String? _selectedImagePath;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _selectImageFromGallery() async {
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImagePath = pickedImage.path;
      });

      // Upload da imagem para o Firebase Storage
      File imageFile = File(pickedImage.path);
      String imageName = "profile_image.jpg"; // Nome da imagem no Firebase Storage

      try {
        // Obtém o usuário autenticado
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          TaskSnapshot uploadTask = await _storage
              .ref()
              .child("profile_images/${user.uid}/$imageName") // Caminho com o UID do usuário
              .putFile(imageFile);

          String downloadUrl = await uploadTask.ref.getDownloadURL();

          // Aqui você pode utilizar o URL da imagem no Firebase Storage
          print("URL da imagem no Firebase Storage: $downloadUrl");
        } else {
          print("Usuário não autenticado!");
        }
      } catch (e) {
        print("Erro ao fazer upload da imagem: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _selectedImagePath != null
                ? Image.file(File(_selectedImagePath!)).image
                : AssetImage("assets/images/profile.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: _selectImageFromGallery,
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
