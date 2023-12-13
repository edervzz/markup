import 'package:flutter/material.dart';

import '../entities/_entities.dart';
import '../widgets/_widgets.dart';

class HomeScreen extends StatefulWidget {
  final List<Property>? properties;
  const HomeScreen({super.key, this.properties});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var props = PropertiesWidget(properties: widget.properties);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            props,
            const ContactWidget(),
          ],
        ),
      ),
    );
  }
}
