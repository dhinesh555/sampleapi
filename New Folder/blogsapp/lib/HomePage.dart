import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void _logoutUser() {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Home"),
      ),
      body: new Container(),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.blue,
        child: new Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.local_car_wash),
                iconSize: 30,
                color: Colors.white,
                onPressed: _logoutUser,
              ),
              new IconButton(
                  icon: new Icon(Icons.save),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
