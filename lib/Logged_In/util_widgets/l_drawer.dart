import 'package:carapp/providers/google_sign_in.dart';
import 'package:carapp/providers/nav_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LDrawer extends StatefulWidget {
  const LDrawer({ Key? key }) : super(key: key);

  @override
  State<LDrawer> createState() => _LDrawerState();
}

class _LDrawerState extends State<LDrawer> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage : NetworkImage(user.photoURL!),
                ),
                Text(user.displayName.toString()),
              ],
            ),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: 
              () {
                _goToHome();
                context.read<NavUI>().changeNumber(0);
              }
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Inventory'),
            onTap: 
              () {
                _goToInventory();
                context.read<NavUI>().changeNumber(1);
              }
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: 
              (){
                _goToProfilePage();
                context.read<NavUI>().changeNumber(2);
              }
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              final myotherprovider = Provider.of<GoogleSignInProvider>(context, listen: false);
              myotherprovider.signOut();
            },
            icon: const Icon(Icons.logout),
            label: const Text("Sign Out"), 
          ),
        ],
      ),
    );
  }
  void _goToInventory() {
    Navigator.popAndPushNamed(context, "/Inventory");
  }

  void _goToProfilePage() {
    Navigator.popAndPushNamed(context, '/ProfilePage');
  }

  void _goToHome() {
    Navigator.popAndPushNamed(context, '/');
  }
}
