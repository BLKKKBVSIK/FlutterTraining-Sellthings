import 'package:bvsik/models/user.dart';
import 'package:bvsik/screens/authenticate/authenticate.dart';
import 'package:bvsik/screens/home/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class Wrapper extends StatelessWidget {
   @override
   Widget build(BuildContext context) {

     final User user = Provider.of<User>(context);
     //Auth wrapper
     return user == null ? Authenticate() : NavigationBar();
   }
 }