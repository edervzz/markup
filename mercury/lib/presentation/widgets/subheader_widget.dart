import 'package:flutter/material.dart';

class Subheader extends StatelessWidget {
  final String text1, text2;
  const Subheader({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Text(text1.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
            )),
        Text(text2,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ))
      ],
    );
  }
}
