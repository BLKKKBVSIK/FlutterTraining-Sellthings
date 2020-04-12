import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/screens/home/homepage/HomePage.dart';
import 'package:bvsik/screens/home/profile/profile.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  static const String routeName = '/navigation';

  @override
  State<StatefulWidget> createState() => _NavigationBar();
}

class _NavigationBar extends State<NavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> navBar = <Widget>[
    HomePage(),
    ProfilePage()
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
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: darkNightMode ? textDarkTheme : Colors.black,
        backgroundColor: darkNightMode ? menuDarkTheme : Colors.white,
        onTap: _onItemTapped,
      ),
      body: navBar[_selectedIndex],
    );
  }
}
