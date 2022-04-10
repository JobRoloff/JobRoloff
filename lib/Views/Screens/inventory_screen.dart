import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';
import '../util_widgets/l_drawer.dart';
import '../util_widgets/menuitems/menuitem.dart';
import '../util_widgets/menuitems/menuitems.dart';


class InventoryPage extends StatefulWidget{
  const InventoryPage({Key? key,}) : super(key: key);
  @override
  State<InventoryPage> createState() => _InventoryPageState();
    static var testnum = 0;
}
int numInventory = 1;

bool isVisible = false; 
final user = FirebaseAuth.instance.currentUser!;
CollectionReference Inventory = FirebaseFirestore.instance.collection('Users').doc(user.uid).collection('Inventory');

class _InventoryPageState extends State<InventoryPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const LDrawer(),
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(InventoryPage.testnum.toString()),
              ListView.builder(
                //lists are by defalult
                //infinitie in length regardless of the number
                //of items are actually in it.. 
                //we need to keep it 
                //containedon the screen

                shrinkWrap: true,

                //get number of documents in a firebase user's collection
                
                itemCount: 1,
                
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("item number : $index"),
                    trailing: PopupMenuButton<MenuItem>(
                      onSelected: null, 
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
                        const PopupMenuItem(
                          value: MenuItems.itemEdit,
                          child: Text("Edit"),
                        ),
                        const PopupMenuItem(
                          value: MenuItems.itemDelete,
                          child: Text("Delete"),
                        ),
                        
                      ],
                    ),
                    onTap: _inctestnum,
                  );
                }
              )
            ],
        ),
        
      bottomNavigationBar: LBottomNav(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: _goToAddItem
      ),
    );

  
  }
  
  void _goToAddItem() {
    Navigator.pushNamed(context, '/AddItem');
    setState(() {
      _inctestnum();
    });
  }

  void _inctestnum() {
    InventoryPage.testnum++;
  }
}