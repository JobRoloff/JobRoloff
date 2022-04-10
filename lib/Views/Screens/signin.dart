
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/google_sign_in.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SigninPage> createState() => _SigninPageState();
}
class _SigninPageState extends State<SigninPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ),
      ),
      drawer:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            const DrawerHeader(child: Spacer()),
            ListTile(
              leading: const Icon(Icons.login),
              trailing: const Text("Login"),
              onTap: (){
                final myprovider = Provider.of<GoogleSignInProvider>(context, listen: false);
                myprovider.googleLogin();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("login"),
              onPressed: (){
                final myprovider = Provider.of<GoogleSignInProvider>(context, listen: false);
                myprovider.googleLogin();
              },
            ),
          ],
        ),
      ),
    );
  }

}
