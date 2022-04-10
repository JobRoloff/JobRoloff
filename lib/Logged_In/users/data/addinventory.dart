
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future <void> addInventory(String t, double p) async{
  final user = FirebaseAuth.instance.currentUser!;
  DocumentReference userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
  userDoc.collection("Inventory").add({
    'Item Title': t,
    'Price': p,
  });
}