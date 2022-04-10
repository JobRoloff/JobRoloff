import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth auth = FirebaseAuth.instance;
final user = auth.currentUser!;


Future<void> addUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.doc(user.uid).set({
    'Display Name': user.displayName,
    'Email': user.email,
  })
    .then((value) => print ("User Added"))
    .catchError((error) => print("couldn't add user because -> $error"));
}

