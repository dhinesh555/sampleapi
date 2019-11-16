import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleapi/services/auth_service.dart';

class SampleApi extends StatefulWidget {
  static final String id = 'SampleApi';
  @override
  _SampleApiState createState() => _SampleApiState();
}

class _SampleApiState extends State<SampleApi> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  String _email;
  String _password;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3E3FBA),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Image.asset(
              "Assets/images/bg_1.jpg",
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(left: 90, top: 38),
              child: Image.asset(
                "Assets/images/first.png",
                width: 170,
                height: 170,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(70),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Material(
                                  elevation: 2.5,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: TextFormField(
                                    onChanged: (String value) {},
                                    cursorColor: Colors.black54,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 13)),
                                    validator: (input) => !input.contains('@')
                                        ? 'please enter a valid email'
                                        : null,
                                    onSaved: (input) => _email = input,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Material(
                                  elevation: 3,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: TextFormField(
                                    onChanged: (String value) {},
                                    cursorColor: Colors.black54,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        prefixIcon: Material(
                                          elevation: 0,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 17)),
                                    validator: (input) => input.length < 6
                                        ? 'Must be atleast 6 characters'
                                        : null,
                                    onSaved: (input) => _password = input,
                                    obscureText: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              color: Colors.grey,
                              onPressed: _submit,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Divider(
                              height: 10,
                              thickness: 2,
                              indent: 1,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              color: Colors.grey,
                              onPressed: _submits,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
      Authservice.signUpUser(
        context,
        _email,
        _password,
      );
    }
  }

  void _submits() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      Authservice.login(
        context,
        _email,
        _password,
      );
    }
  }
}
