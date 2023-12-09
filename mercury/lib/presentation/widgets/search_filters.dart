import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/constants/constants.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(
        child: Column(
          children: [
            AnimatedButtonBar(
              radius: 10.0,
              backgroundColor: Colors.white,
              foregroundColor: pasiveColor,
              elevation: 0,
              padding: const EdgeInsets.all(6.0),
              animationDuration: const Duration(milliseconds: 400),
              invertedSelection: true,
              children: [
                ButtonBarEntry(
                    onTap: () => {},
                    child: Text(AppLocalizations.of(context)!.buy)),
                ButtonBarEntry(
                    onTap: () => {},
                    child: Text(AppLocalizations.of(context)!.offices)),
                ButtonBarEntry(
                    onTap: () => {},
                    child: Text(AppLocalizations.of(context)!.lands)),
                ButtonBarEntry(
                    onTap: () => {},
                    child: Text(AppLocalizations.of(context)!.preOwned))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
