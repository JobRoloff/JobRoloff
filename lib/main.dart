import 'package:carapp/Views/Screens/profile.dart';
import 'package:carapp/light_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controllers/bottom_nav.dart';
import 'Controllers/google_sign_in.dart';
import 'Controllers/inventory.dart';
import 'Controllers/light_provider.dart';
import 'Views/Screens/additem.dart';
import 'Views/Screens/inventory.dart';
import 'firebase_options.dart';
import 'Views/Screens/first_screen.dart';


Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LightPreferences.init();  
  
  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavUI(),
        ),
        ChangeNotifierProvider(
          create: (context) => InventoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LightProvider(),
        ),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) { 
  return 
    MaterialApp(
      theme: ThemeData(
        primarySwatch: 
        Colors.blue 
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: 
        context.watch<LightProvider>().isDark! ? ThemeMode.dark : ThemeMode.light
      ,
      initialRoute: '/',
      routes: {
      '/': (context) => FirstScreen(),
      // '/LoggedInHomePage': (context) => LoggedInHomePage(title : 'x'),
      '/Inventory': (context) => const InventoryPage(),
      '/AddItem': (context) => const AddItemPage(),
      '/ProfilePage':(context) => const ProfilePage(),
      },
    
  );

}
}