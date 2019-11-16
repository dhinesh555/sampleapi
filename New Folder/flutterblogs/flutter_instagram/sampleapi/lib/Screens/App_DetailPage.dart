import 'package:flutter/material.dart';
import 'package:sampleapi/utils/user.dart';
import 'package:sampleapi/Screens/App_Page.dart';
import 'package:sampleapi/services/auth_service.dart';

class AppDetailPage extends StatefulWidget {
  static final String id = 'AppDetailPage';

  @override
  _AppDetailPageState createState() => _AppDetailPageState();
}

class _AppDetailPageState extends State<AppDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,

//        title: Text(snapshot.data[index].title),
      ),
      body: Center(
        child: Text("detail"),
      ),
    );
  }
}
