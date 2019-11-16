import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _LoginRegisterState();
  }
}

enum FormType {
  login,
  register,
}

class _LoginRegisterState extends State<LoginRegisterPage> {
  final formKey = new GlobalKey<FormState>();

  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Flutter Blogs App"),
      ),
      body: new Container(
        margin: EdgeInsets.all(10.0),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 5.0,
      ),
      logo(),
      SizedBox(
        height: 5,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) {
          return value.isEmpty ? 'Email is required.' : null;
        },
        onSaved: (value) {
          return _email = value;
        },
      ),
      SizedBox(
        height: 7,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          return value.isEmpty ? 'password is required.' : null;
        },
        onSaved: (value) {
          return _password = value;
        },
      ),
      SizedBox(
        height: 7,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'Hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 130,
        child: Image.asset('Images/image_01.jpeg'),
      ),
    );
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text(
            "Login",
            style: new TextStyle(
              fontSize: 15,
            ),
          ),
          textColor: Colors.white,
          color: Colors.blueGrey[400],
          onPressed: validateAndSave,
        ),
        new FlatButton(
          child: new Text(
            "Not have an account? Create Account",
            style: new TextStyle(
              fontSize: 15,
            ),
          ),
          textColor: Colors.red,
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text(
            "Create Account",
            style: new TextStyle(
              fontSize: 15,
            ),
          ),
          textColor: Colors.white,
          color: Colors.blueGrey[400],
          onPressed: validateAndSave,
        ),
        new FlatButton(
          child: new Text(
            "Already have an Account?Login",
            style: new TextStyle(
              fontSize: 15,
            ),
          ),
          textColor: Colors.red,
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
