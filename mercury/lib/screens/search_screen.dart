import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:mercury/constants.dart';
import 'package:mercury/widgets/search_filters_widget.dart';

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
