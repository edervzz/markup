import 'package:flutter/material.dart';
import 'package:mercury/presentation/navbar/navbar.dart';

class HomeScreen extends StatefulWidget {
  static String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF4966F2), //234099
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_white_markup.png',
                fit: BoxFit.fitHeight,
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
              ),
              Image.asset(
                'assets/images/text_white_markup.png',
                fit: BoxFit.fitHeight,
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
              ),
            ],
          )),
      body: const Center(
        child: Text("Hello"),
      ),
    );
  }
}
