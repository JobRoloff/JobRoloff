import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';
import '../util_widgets/l_drawer.dart';


class InventoryPage extends StatefulWidget{
  const InventoryPage({Key? key,}) : super(key: key);
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

// final user = FirebaseAuth.instance.currentUser!;
CollectionReference userInventoryReference = FirebaseFirestore.instance.collection("Inventory");

class _InventoryPageState extends State<InventoryPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventory Page")),
      drawer: const LDrawer(),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,      
              itemCount: 0,
              //build first 10 as their created
              //anything past 10 gets lazy loaded
              itemBuilder: (BuildContext context, int index) {
                return 
                  ListTile(
                    title: Text("t"
                      // userInventoryReference.get()
                      // InventoryProvider.userInventory[index].itemTitle
                      ),
                      // Provider.of<InventoryProvider>(context, listen: true).userInventory[0]
                    // ),
                    subtitle: Text("item number : " + (index+1).toString()),
                    // trailing: PopupMenuButton<MenuItem>(
                    //   onSelected: null, 
                    //   itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
                    //     const PopupMenuItem(
                    //       value: MenuItems.itemEdit,
                    //       child: Text("Edit"),
                    //     ),
                    //     const PopupMenuItem(
                    //       value: MenuItems.itemDelete,
                    //       child: Text("Delete"),
                    //     ),
                    //   ],
                    // ),
                    onTap: null,
                  );
              }
            ),




            // pass item name to this route upon pop...
            // SnackBar(
            //   content: Text('$'),
            // ),
          
          
          
          
          
          ],
        ),
        
      bottomNavigationBar: LBottomNav(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: _goToAddItem
        //this but with route builder??
      ),
    );

  
  }
  
  void _goToAddItem() {
    Navigator.pushNamed(context, '/AddItem');
  }
  
}