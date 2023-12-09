import 'package:flutter/material.dart';
import 'package:mercury/constants/constants.dart';
import 'package:mercury/presentation/favorites_screen.dart';
import 'package:mercury/presentation/home_screen.dart';
import 'package:mercury/presentation/search_screen.dart';
import 'package:mercury/presentation/widgets/navbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainerScreen extends StatefulWidget {
  static String name = 'home-screen';
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int screenIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navButtons = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home, color: mainColor),
        label: AppLocalizations.of(context)!.home,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search, color: mainColor),
        label: AppLocalizations.of(context)!.search,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_outline),
        activeIcon: const Icon(Icons.favorite, color: mainColor),
        label: AppLocalizations.of(context)!.favorite,
      ),
    ];

    return Scaffold(
      endDrawer: const NavBar(),
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: mainColor, //234099
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo_white_markup.png',
                fit: BoxFit.fitHeight,
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
              ),
              Image.asset(
                'assets/images/text_white_markup.png',
                fit: BoxFit.fitHeight,
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
              ),
            ],
          )),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: screenIndex,
          onTap: (value) {
            setState(() {
              screenIndex = value;
            });
          },
          //views home
          type: BottomNavigationBarType.fixed,
          items: navButtons),
    );
  }
}
