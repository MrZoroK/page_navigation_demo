import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'common/page_name.dart';
import 'common/drawer.dart';
import 'common/page_nav_mgr.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(PageName.SETTING.name)),
      body: Center(
        child: Text(PageName.SETTING.name + " Screen"),
      ),
      drawer: DemoDrawer(),
      bottomNavigationBar: pageNavMgr.buildBottom(context, dynTab: PageName.SETTING),
    );
  }
}