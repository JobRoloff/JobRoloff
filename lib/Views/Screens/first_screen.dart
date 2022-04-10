import 'package:carapp/Views/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../signin.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({ Key? key }) : super(key: key);
  // var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges() ,
      builder: (context, snapshot) {
        //Waiting
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } 
        //connection success
        else if (snapshot.hasData) {
          return HomePage(title: ('Dashboard'));
        } 
        //connection failed
        else if (snapshot.hasError) {
          return const Center(child: Text("boofed..."));
        }
        
        //Go to Sign in screen
        else {
          return const SigninPage(title: "Sign in...");
        }
      }
    ),
  );
  
}