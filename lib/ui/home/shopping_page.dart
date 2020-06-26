import 'package:flutter/material.dart';
import 'package:menus_navigation_demo/ui/common/page_name.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(PageName.SHOPPING.name + " Page"),
    );
  }
}