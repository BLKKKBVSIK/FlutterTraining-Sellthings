import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/screens/authenticate/register.dart';
import 'package:bvsik/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Widget _descText = RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 18),
        children: <TextSpan>[
          const TextSpan(text: 'Vendez ou acheter '),
          TextSpan(
              text: 'facilement',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' vos objets\ngrâce à '),
          TextSpan(
              text: 'Sell',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),
          TextSpan(
              text: 'Things', style: TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: '\nRejoignez-nous au plus vite !'),
        ],
      ),
      softWrap: true,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.center);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  width: 175,
                  child: Container(
                      child: Image.asset(
                    'assets/logo.png',
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Container(
                    child: Hero(
                      tag: 'registerSVG',
                      child: SvgPicture.asset(
                        'assets/register.svg',
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                    ),
                  ),
                ),
                _desc(),
                Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container()),
                _buildSocialSignIn('CONNEXION AVEC GOOGLE', _auth.signInWithGoogle),
                _buildSocialSignIn('SE CONNECTER / S\'INSCRIRE', registerSignIn),
                _buildSocialSignIn('CONTINUER SANS SE CONNECTER', signInAnonymous,
                    outlineButton: true),
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }

  Widget _desc() {
    return Container(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[_descText],
      ),
    );
  }

  Widget _buildSocialSignIn(String label, void Function() handler,
      {bool outlineButton = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: outlineButton
          ? OutlineButton(
              child: Text(
                label,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              ),
              borderSide: BorderSide(color: primaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: handler,
            )
          : RaisedButton(
              child: Text(
                label,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: handler,
            ),
    );
  }

  Future<String> signInAnonymous() async {
    final dynamic result = await _auth.signInAnon();
    if (result == null) {
      print('Error User signin');
    } else {
      print('User signin');
      print(result.uid);
    }
    return 'Ok';
  }

  String registerSignIn() {
    Navigator.of(context).pushNamed(
      AuthScreen.routeName,
    );
    return 'Ok';
  }
}
