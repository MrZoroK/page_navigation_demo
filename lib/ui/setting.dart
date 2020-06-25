import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'common/drawer.dart';
import 'common/page_nav_mgr.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(pageNavMgr.getPageTitle(context))),
      body: Center(
        child: Text("Setting"),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
}