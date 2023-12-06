import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Comfortaa",
      ),
      home: Scaffold(
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
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

/* 
 *routing 
 */
class Routes {
  static var home = "/home";
}
