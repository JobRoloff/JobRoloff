
import 'package:flutter/material.dart';

class NavUI with ChangeNotifier{
  
  //create
  int _masterIndex = 0;
  int get masterIndex => _masterIndex;

  //make it changeable
  void changeNumber(int n){
    _masterIndex = n;
    notifyListeners();
  }

  

}