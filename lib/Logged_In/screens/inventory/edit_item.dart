
import 'package:flutter/material.dart';

class EditItem extends StatefulWidget{
  const EditItem({Key? key}) : super(key: key);

  @override
  State<EditItem> createState()=> _EditItemState();

  final int index = 2;
  
}
  
// final int num = ;

class _EditItemState extends State<EditItem> {

  // final GlobalKey<FormState> _formKey = GlobalKey()<FormState>;

  @override
  Widget build(index) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit item Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text("Enter item name"),
                TextFormField(),
              ],
            ),
          ],
        ),),
    ); 
  }
}


//
//on fab att item, route to a page to input data
//
// create another fab to save that data..
// 
//from the saved data, create a new list item that represents the 
//new row