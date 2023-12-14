import 'package:flutter/material.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.anyplace.com/home/thumbnail.jpg"),
                    fit: BoxFit.cover)),
            child: const SearchFilter(),
          ),
        ],
      ),
    );
  }
}
