 import 'package:bvsik/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

 class AuthService {

   final FirebaseAuth _auth = FirebaseAuth.instance;

   //create User() from FireBaseUser() 
   User _userFromFirebaseUser(FirebaseUser user) {
      return user != null ? User(uid: user.uid) : null;
   }

   //detect change user stream
   Stream<User> get user {
     return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
   }

   //signin Anon
   Future signInAnon() async {
     try {
       AuthResult result = await _auth.signInAnonymously();
       FirebaseUser user = result.user;
       return _userFromFirebaseUser(user);

     } catch(e) {
       print(e.toString());
       return null;
     }
   }

   //signin with email/password

   //register with email/password

   //signout
   Future signOut() async {
     try {
       return await _auth.signOut();
     } catch(e) {
       print(e.toString());
       return null;
     }
   }

   //signin with Google
 }