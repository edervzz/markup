import 'package:flutter/material.dart';
import 'package:mercury/constants.dart';
import 'package:mercury/entities/property.dart';
import 'package:mercury/screens/favorites_screen.dart';
import 'package:mercury/screens/home_screen.dart';
import 'package:mercury/screens/search_screen.dart';
import 'package:mercury/widgets/navbar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainerWidget extends StatefulWidget {
  static String name = 'home-screen';
  late List<Property> properties;
  ContainerWidget({super.key}) {
    properties = List.empty(growable: true);
    properties.add(
      Property(
          type: "buy",
          rooms: 1,
          mt2: 400,
          levels: 2,
          location: "Insurgentes Sur",
          price: 2000001,
          propertyName: "Alamo",
          bathrooms: 3,
          isFavorite: true),
    );
    properties.add(
      Property(
          type: "rent",
          rooms: 2,
          bathrooms: 1,
          levels: 1,
          mt2: 84,
          location: "Bonfil",
          price: 8003,
          propertyName: "Av 16 de Septiembre",
          isFavorite: false),
    );
  }

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  int screenIndex = 0;

  List<Widget> screens = List.empty(growable: true);
  List<Property> properties = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    properties = List.empty(growable: true);
    properties.add(
      Property(
          type: "buy",
          rooms: 1,
          mt2: 400,
          levels: 2,
          location: "Insurgentes Sur",
          price: 2000001,
          propertyName: "Alamo",
          bathrooms: 3,
          isFavorite: true),
    );
    properties.add(
      Property(
          type: "buy",
          rooms: 1,
          mt2: 400,
          levels: 2,
          location: "Insurgentes Sur",
          price: 2000001,
          propertyName: "ZXCV",
          bathrooms: 3,
          isFavorite: true),
    );
    properties.add(
      Property(
          type: "rent",
          rooms: 2,
          bathrooms: 1,
          levels: 1,
          mt2: 84,
          location: "Bonfil",
          price: 8003,
          propertyName: "Av 16 de Septiembre",
          isFavorite: false),
    );
    screens.add(HomeScreen(
      properties: properties,
    ));
    screens.add(const SearchScreen());
    screens.add(const SearchScreen());

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
