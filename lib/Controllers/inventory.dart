import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class InventoryProvider with ChangeNotifier {
//store sum and all inventory to db
static int currentSum = 0;
//for now just show all inventory in the list builder from this list
// static List<Item> userInventory = [
  

// ];



final authUser = FirebaseAuth.instance.currentUser!;
Future <void> addInventory(GlobalKey<FormState> key, String itemTitle, double price) async{
  await FirebaseFirestore.instance.collection('Users').doc(authUser.uid).collection('Inventory').doc(key.toString()).set({
    'Item Title': itemTitle,
    'Price': price,
  }
  );

  // userInventory.add(
  //   Item(
  //     itemTitle: itemTitle, 
  //     price: price
  //   )
  // );
  incrimentSum();
  notifyListeners();
}

void incrimentSum(){
  currentSum++;
  notifyListeners();
}


}

