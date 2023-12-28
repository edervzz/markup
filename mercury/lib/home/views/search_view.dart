import 'package:flutter/material.dart';
import 'package:mercury/home/widgets/_widgets.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<StatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
            child: const SearchFilterWidget(),
          ),
        ],
      ),
    );
  }
}
