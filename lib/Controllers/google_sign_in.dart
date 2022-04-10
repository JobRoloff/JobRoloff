
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  //! after variable which we created as nullable makes it not nullable
  Future googleLogin() async {
    //start the google sign in flow by calling the sign in instance's sign in method
    try{
      final googleUser = await googleSignIn.signIn();

        if (googleUser == null) return;
        //if the user aborts the sign in process, abort the sign in function
        _user = googleUser;
        //hold onto the sign in method's return as a variable because it represents a reference
        //to the current account trying to log in

      //with the reference to the account thats trying to sign in, we need a deeper reference to
      //where they hold onto data that proves its really them. 
      final googleUserAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleUserAuth.accessToken,
        idToken: googleUserAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){
      print(e.toString());
    }
    addUser();
    notifyListeners();
  }
  
  Future signOut() async{ 
    try{
      await googleSignIn.signOut();
      FirebaseAuth.instance.signOut();
    } 
    catch(e){
      print(e.toString());
    }
    notifyListeners();
  }

}


final authUser = FirebaseAuth.instance.currentUser!;
    Future<void> addUser() async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  users.doc(authUser.uid).set({
    'Display Name': authUser.displayName,
    'Email': authUser.email,
  })
    // .then((value) => print ("User Added"))
    // ignore: avoid_print
    .catchError((error) => print("couldn't add user because -> $error"));
}