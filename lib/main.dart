import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/authenticate/register.dart';
import 'package:bvsik/screens/home/navigation_bar.dart';
import 'package:bvsik/screens/home/profile/profile.dart';
import 'package:bvsik/screens/wrapper.dart';
import 'package:bvsik/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          AuthScreen.routeName: (BuildContext ctx) => AuthScreen(),
          NavigationBar.routeName: (BuildContext ctx) => NavigationBar(),
        },
      ),
    );
  }
}
