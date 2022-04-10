
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/bottom_nav.dart';

class LBottomNav extends StatefulWidget {
  LBottomNav({ Key? key }) : super(key: key);
  @override
  State<LBottomNav> createState() => _LBottomNavState();
}

var screenOption = [
  // LoggedInHomePage(title: "HomePage"),
  '/',
  // InventoryPage(),
  '/Inventory',
  // ProfilePage(),
  '/ProfilePage',
];

class _LBottomNavState extends State<LBottomNav> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<NavUI>().masterIndex,
      selectedItemColor: Colors.blue,
      onTap: (index) { 
        context.read<NavUI>().changeNumber(index);
        Navigator.popAndPushNamed(context, screenOption[index]);
      },
      
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    ); 
  }

}
