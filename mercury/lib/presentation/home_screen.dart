import 'package:flutter/material.dart';
import 'package:mercury/presentation/widgets/property_main_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          PropertyMainInfo(),
        ],
      ),
    );
  }
}
