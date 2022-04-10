import 'package:flutter/material.dart';
import 'menuitem.dart';
class MenuItems {
  static const itemEdit = MenuItem(
    text: 'Edit',
    icon: Icons.abc,
  );
  static const itemDelete = MenuItem(
    text: 'Remove',
    icon: Icons.delete,
  );
  static List <MenuItem> itemset1 = <MenuItem> [
    itemEdit,
    itemDelete,
  ];
}

