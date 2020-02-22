import 'package:bvsik/config/app_config.dart';
import 'package:bvsik/screens/home/homepage/homepage.dart';
import 'package:bvsik/screens/home/profile/profile.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  static const String routeName = '/navigation';

  @override
  State<StatefulWidget> createState() => new _NavigationBar();
}

class _NavigationBar extends State<NavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> navBar = [
    HomePage(),
    Container(
      color: Colors.red,
    ),
    ProfilPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Recherche'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: darkKnighMode ? textDarkTheme : Colors.black,
        backgroundColor: darkKnighMode ? menuDarkTheme : Colors.white,
        onTap: _onItemTapped,
      ),
      body: navBar[_selectedIndex],
    );
  }
}
