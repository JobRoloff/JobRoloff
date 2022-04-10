import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Logged_In/users/data/adduser.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googlesignin = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  //! after variable which we created as nullable makes it not nullable
  //this is desired because when we create an accessor,  
  Future googleLogin() async {
    final googleUser = await googlesignin.signIn();
    if (googleUser == null) return;
    //the variable googleuser is what the end user selects as their profile on the sign in popup
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    addUser();
    notifyListeners();
  }
  Future signOut() async {
    await googlesignin.disconnect();
    FirebaseAuth.instance.signOut();
  }
  




}