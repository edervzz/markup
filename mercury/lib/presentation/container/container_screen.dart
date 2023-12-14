import 'package:flutter/material.dart';
import 'package:mercury/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mercury/domain/entities/_entities.dart';
import 'package:mercury/presentation/views/favorites/favorites_view.dart';
import 'package:mercury/presentation/views/home/home_view.dart';
import 'package:mercury/presentation/views/search/search_view.dart';
import 'package:mercury/presentation/widgets/_widgets.dart';

class ContainerScreen extends StatefulWidget {
  static String name = 'home-screen';

  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int screenIndex = 0;

  List<Widget> screens = List.empty(growable: true);
  List<Property> properties = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    screens.add(const HomeView());
    screens.add(const SearchView());
    screens.add(const FavoriteView());

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
      endDrawer: const NavBarWidget(),
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
