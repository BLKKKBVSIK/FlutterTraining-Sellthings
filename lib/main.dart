import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/authenticate/register.dart';
import 'package:bvsik/screens/home/navigation_bar.dart';
import 'package:bvsik/screens/wrapper.dart';
import 'package:bvsik/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MaterialApp(
        home: SplashScreen(
          'assets/SplashSell.flr',
          MyApp(),
          startAnimation: 'start',
          backgroundColor: Colors.white,
        )));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: <String, Widget Function(BuildContext)>{
          AuthScreen.routeName: (BuildContext ctx) => AuthScreen(),
          NavigationBar.routeName: (BuildContext ctx) => NavigationBar(),
        },
      ),
    );
  }
}
