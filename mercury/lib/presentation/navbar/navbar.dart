import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              AppLocalizations.of(context)!.greeting,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: null,
            currentAccountPicture: Image.asset(
              'assets/images/logo_white_markup.png',
              fit: BoxFit.fitHeight,
              height: 40,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF234099),
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
