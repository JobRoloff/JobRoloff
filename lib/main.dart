import 'package:carapp/Logged_In/screens/loggedinhomepage.dart';
import 'package:carapp/providers/google_sign_in.dart';
import 'package:carapp/providers/nav_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Logged_In/screens/inventory/inventory.dart';
import 'Logged_In/screens/inventory/additem.dart';
import 'Logged_In/screens/profile.dart';
import 'firebase_options.dart';
import 'homepage.dart';


Future<void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

// final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => 
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => NavUI(),
      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
      '/': (context) => HomePage(),
      '/Inventory': (context) => const InventoryPage(),
      '/AddItem': (context) => const AddItemPage(),
      '/ProfilePage':(context) => const ProfilePage(),
      '/LoggedInHomePage': (context) => LoggedInHomePage(title : 'x'),
      },
    ),
  );

}