import 'package:bvsik/config/app_config.dart';
import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/home/navigation_bar.dart';
import 'package:bvsik/screens/home/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bvsik/services/auth.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon,
          size: 20, color: darkKnighMode ? textDarkTheme : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: darkKnighMode ? textDarkTheme : Colors.black,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final List<Widget> aboutBoxChildren = <Widget>[
      const Text('SellThings, l app inutile qu il vous faut !'),
    ];

    return Drawer(
      child: Container(
        color: darkKnighMode ? menuDarkTheme : Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.12,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.04,
              ),
              alignment: Alignment.center,
              color: darkKnighMode ? menuDarkTheme : Colors.white,
              child: darkKnighMode
                  ? Image.asset(
                      'assets/logoWhite.png',
                    )
                  : Image.asset(
                      'assets/logo.png',
                    ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.02,
            ),
            buildListTile('Dark Knight Mode', Icons.brightness_2, () {
              darkKnighMode = !darkKnighMode;
              Navigator.of(context)
                  .pushReplacementNamed(NavigationBar.routeName);
            }),
            buildListTile('Se déconnecter', Icons.exit_to_app, () async {
              await _auth.signOut();
            }),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AboutListTile(
                  child: Text(
                    'Crédits',
                    style: TextStyle(
                      fontSize: 18,
                      color: darkKnighMode ? textDarkTheme : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icon(Icons.info,
                      color: darkKnighMode ? textDarkTheme : Colors.black),
                  applicationIcon: Image.asset(
                    'assets/logo.png',
                    height: (MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.07,
                    width: (MediaQuery.of(context).size.height -
                            AppBar().preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.13,
                  ),
                  applicationName: 'SellThings',
                  applicationVersion: '1.0.0',
                  applicationLegalese:
                      'by Enzo CONTY, Hadrien GOUTAS, Romain KANIA',
                  aboutBoxChildren: aboutBoxChildren,
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.03,
            )
          ],
        ),
      ),
    );
  }
}