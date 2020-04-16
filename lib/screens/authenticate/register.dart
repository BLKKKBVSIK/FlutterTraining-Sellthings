import 'package:bvsik/config/AppConfig.dart';
import 'package:bvsik/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AuthMode { SignUp, Login }

final AuthService _auth = AuthService();

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 0),
              width: 175,
              child: Container(
                  child: Image.asset(
                'assets/logo.png',
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: Hero(
                  tag: 'registerSVG',
                  child: SvgPicture.asset(
                    'assets/register.svg',
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              flex: deviceSize.width > 600 ? 2 : 1,
              child: const AuthCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = <String, String>{
    'email': '',
    'password': '',
    'firstname': '',
    'lastname': '',
  };
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      final dynamic result = await _auth.signInWithEmailPassword(
          _authData['email'], _authData['password']);
      if (result == null) {
        print('Its null !');
        AlertDialog(
          title: const Text('Alert Dialog title'),
          content: const Text('Alert Dialog body'),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } else {
        print('its a user !');
        Navigator.of(context).pop();
      }
    } else {
      await _auth.registerWithEmailPassword(
          _authData['email'], _authData['password']);
      Navigator.of(context).pop();
      // Sign user up
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          height: _authMode == AuthMode.SignUp ? 520 : 460,
          constraints: BoxConstraints(
              minHeight: _authMode == AuthMode.SignUp ? 520 : 460),
          width: deviceSize.width * 0.90,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return '';
                    },
                    onSaved: (String value) {
                      _authData['email'] = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (String value) {
                      if (value.isEmpty || value.length < 6) {
                        return 'Password is too short!';
                      }
                      return '';
                    },
                    onSaved: (String value) {
                      _authData['password'] = value;
                    },
                  ),
                  if (_authMode == AuthMode.SignUp)
                    TextFormField(
                      enabled: _authMode == AuthMode.SignUp,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _authMode == AuthMode.SignUp
                          ? (String value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                              return '';
                            }
                          : null,
                    ),
                  if (_authMode == AuthMode.SignUp)
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'First Name'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Invalid name !';
                        }
                        return 'Success';
                      },
                      onSaved: (String value) {
                        _authData['firstname'] = value;
                      },
                    ),
                  if (_authMode == AuthMode.SignUp)
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Invalid name !';
                        }
                        return 'Success';
                      },
                      onSaved: (String value) {
                        _authData['lastname'] = value;
                      },
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    RaisedButton(
                      child: Text(
                          _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      color: primaryColor,
                      textColor:
                          Theme.of(context).primaryTextTheme.button.color,
                    ),
                  FlatButton(
                    child: Text(
                        '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                    onPressed: _switchAuthMode,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
