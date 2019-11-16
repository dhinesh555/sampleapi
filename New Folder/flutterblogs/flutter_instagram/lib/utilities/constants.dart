import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firebase = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();

final userRef = _firebase.collection('users');
