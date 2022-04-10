
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';
import '../util_widgets/l_drawer.dart';


class LoggedInHomePage extends StatefulWidget {
  LoggedInHomePage({Key? key, required this.title}) : super(key: key);

  var title;
  
  @override
  State <LoggedInHomePage> createState() => _LoggedInHomePageState();
}
class _LoggedInHomePageState extends State <LoggedInHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ), 
      drawer: const LDrawer(),
      body: Column(
        children: [
          
        ],
      ),
      bottomNavigationBar: 
      LBottomNav()
    );
  }
}
