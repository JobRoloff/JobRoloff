import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/inventory.dart';
import '../util_widgets/l_bottom_nav.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key,}) : super(key: key);
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //this is what differentiates different forums!!!

  // String title = '';
  // double price = 0;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  //the controller is the magic sauce that allows for the 
  // text input to be selected
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a new item")),
      body:
        Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Item Title',
                    ),
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      hintText: 'Price',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
          ),
        ),
        bottomNavigationBar:  LBottomNav(),
        floatingActionButton: FloatingActionButton(
          tooltip: "Save",
          child: const Icon(Icons.save), 
          onPressed: () {
            context.read<InventoryProvider>().addInventory(_formKey, nameController.text, double.parse(priceController.text));
            Navigator.pop(context);
          },
        ),
    );
  }
}
