import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util_widgets/l_bottom_nav.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key,}) : super(key: key);
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}
FirebaseAuth auth = FirebaseAuth.instance;
final user = auth.currentUser!;

class _AddItemPageState extends State<AddItemPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AddItemPage")),
      body:
        Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Item Title',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Price',
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        bottomNavigationBar: LBottomNav(),
        floatingActionButton: FloatingActionButton(
          tooltip: "Save",
          child: const Icon(Icons.save), 
          onPressed: () {
            //throw down the add item fxn 
            // addInventory();
          },
        ),
    );
  }
}