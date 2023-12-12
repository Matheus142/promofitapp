import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

class InitScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const InitScreen({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("Favoritos")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.favorite),
            label: 'Você ainda não tem favoritos',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
              // ignore: prefer_const_constructors
              child: Icon(Icons.person),
            ),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
