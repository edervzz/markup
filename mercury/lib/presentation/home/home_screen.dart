import 'package:flutter/material.dart';
import 'package:mercury/navbar.dart';

class HomeScreen extends StatefulWidget {
  static String name = 'booking-home-screen';
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
        backgroundColor: Colors.grey,
        title: const Text("Home", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
