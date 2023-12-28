import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/shared/constants.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Text(
              AppLocalizations.of(context)!.menu,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: globalColorMain,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(AppLocalizations.of(context)!.home),
          ),
          ListTile(
            leading: const Icon(Icons.grade_outlined),
            title: Text(AppLocalizations.of(context)!.projects),
          ),
          ListTile(
            leading: const Icon(Icons.apartment_outlined),
            title: Text(AppLocalizations.of(context)!.offices),
          ),
          ListTile(
            leading: const Icon(Icons.grass_outlined),
            title: Text(AppLocalizations.of(context)!.lands),
          ),
          ListTile(
            leading: const Icon(Icons.cyclone_outlined),
            title: Text(AppLocalizations.of(context)!.preOwned),
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: Text(AppLocalizations.of(context)!.aboutUs),
          ),
        ],
      ),
    );
  }
}
