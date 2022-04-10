import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Logged_In/screens/loggedinhomepage.dart';
import 'Sign_In/signin.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedInHomePage(title: 
          (
          ' Home'
          )
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("boofed..."));
        } else {
          return SigninPage(title: "Sign in...");
        }
      }
    ),
  );
  
}