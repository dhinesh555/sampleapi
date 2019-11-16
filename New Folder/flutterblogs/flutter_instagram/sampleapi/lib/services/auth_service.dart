import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sampleapi/Screens/App_Page.dart';
import 'package:sampleapi/Screens/Login_Page.dart';

class Authservice {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static void signUpUser(
      BuildContext context, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedUser = authResult.user;
      if (signedUser != null) {
        _firestore.collection('users').document(signedUser.uid).setData({
          'email': email,
        });
        Navigator.pushReplacementNamed(context, AppPage.id);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, SampleApi.id);
  }

  static void login(BuildContext context, String email, String password) async {
    _auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushReplacementNamed(context, AppPage.id);
  }
}
