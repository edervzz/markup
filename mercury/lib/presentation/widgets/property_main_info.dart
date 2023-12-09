import 'package:flutter/material.dart';

class PropertyMainInfo extends StatefulWidget {
  const PropertyMainInfo({super.key});

  @override
  State<StatefulWidget> createState() => _PropertyMainInfoState();
}

class _PropertyMainInfoState extends State<PropertyMainInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:
          // Card(
          // child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.asset("assets/images/background.jpg", fit: BoxFit.cover),
              Container(
                color: const Color(0xFFE50E0B),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  "BUY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 24),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Álamo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 26,
                  ),
                ),
                Text(
                  "Insurgentes Norte",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$2,000,000",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}
