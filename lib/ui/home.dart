import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menus_navigation_demo/ui/common/page_nav_mgr.dart';

import 'common/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(pageNavMgr.getPageTitle(context))),
      drawer: CustomDrawer(),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
}