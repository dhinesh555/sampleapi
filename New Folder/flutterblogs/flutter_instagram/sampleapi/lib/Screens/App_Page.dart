import 'package:flutter/material.dart';
import 'package:sampleapi/Screens/App_DetailPage.dart';
import 'package:sampleapi/services/auth_service.dart';
import 'package:sampleapi/utils/oval_right.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sampleapi/utils/user.dart';

class AppPage extends StatefulWidget {
  static final String id = 'App_Page';
  final String title;
  final Function function;

  const AppPage({Key key, this.title, this.function}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  Future<List<User>> _getUsers() async {
    var data =
        await http.get("https://jsonplaceholder.typicode.com/albums/1/photos");
    var jsondata = json.decode(data.body);
    List<User> users = [];
    for (var u in jsondata) {
      User user = User(
        u["id"],
        u["title"],
        u["thumbnailUrl"],
        u["url"],
      );
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('AppList'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
      ),
      drawer: _buildDrawer(),
      body: FutureBuilder(
        future: _getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () =>
                          Navigator.pushNamed(context, AppDetailPage.id),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].thumbnailUrl),
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].url));
                });
          }
        },
      ),
    );
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
//        padding: EdgeInsets.only(left: 1, right: 20),
        decoration: BoxDecoration(
          color: primary,
          boxShadow: [BoxShadow(color: Colors.black54)],
        ),
        width: 250,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "Assets/images/bg_1.jpg",
                      width: 300,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.settings_power,
                            color: Colors.red,
                          ),
                          iconSize: 35,
                          onPressed: () => Authservice.logout(context),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 70),
                      child: Image.asset(
                        "Assets/images/first.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _buildRow(Icons.home, "Home", () {}),
                _buildDivider(),
                _buildRow(Icons.settings, "Settings", () {}),
                _buildDivider(),
                _buildRow(Icons.email, "Contact us", () {}),
                _buildDivider(),
                _buildRow(Icons.info_outline, "Help", () {}),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, Function function) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 15);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: active,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
