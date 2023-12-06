import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Bienvenido"),
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
          const ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Inicio"),
          ),
          const ListTile(
            leading: Icon(Icons.group_outlined),
            title: Text("Nosotros"),
          ),
          const ListTile(
            leading: Icon(Icons.grade_outlined),
            title: Text("Proyectos"),
          ),
          const ListTile(
            leading: Icon(Icons.apartment_outlined),
            title: Text("Oficinas"),
          ),
          const ListTile(
            leading: Icon(Icons.grass_outlined),
            title: Text("Terrenos"),
          ),
          const ListTile(
            leading: Icon(Icons.cyclone_outlined),
            title: Text("Seminuevos"),
          )
        ],
      ),
    );
  }
}
