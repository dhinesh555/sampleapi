import 'package:flutter/material.dart';
import 'package:simple2/Register_Screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username;
  String _password;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 600,
              child: RotatedBox(
                quarterTurns: 2,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.deepPurple, Colors.deepPurple.shade200],
                      [Colors.indigo.shade200, Colors.purple.shade200],
                    ],
                    durations: [19640, 10800],
                    heightPercentages: [0.20, 0.25],
                    blur: MaskFilter.blur(BlurStyle.solid, 13),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.bottomRight,
                  ),
                  waveAmplitude: 0,
                  size: Size(double.infinity, double.infinity),
                ),
              ),
            ),
            SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.black26,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.check_circle,
                                      color: Colors.black26,
                                    ),
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  validator: (input) => !input.contains('@')
                                      ? 'please enter a valid email'
                                      : null,
                                  onSaved: (input) => _username = input,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black26,
                                    ),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                  ),
                                  validator: (input) => input.length < 6
                                      ? 'Must be atleast 6 characters'
                                      : null,
                                  onSaved: (input) => _password = input,
                                  obscureText: true,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            color: Colors.pinkAccent,
                            onPressed: _submit,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                fontFamily: 'Satisfy-Regular',
                                color: Colors.black26,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(50),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            color: Colors.pinkAccent,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            onPressed: () =>
                                Navigator.pushNamed(context, RegisterScreen.id),
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontFamily: 'Satisfy-Regular',
                                color: Colors.black26,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print(_username);
      print(_password);
    }
  }
}
