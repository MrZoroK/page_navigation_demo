import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menus_navigation_demo/ui/common/page_nav_mgr.dart';

import 'page_name.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Account"),
            onTap: (){
              String currentPath = ModalRoute.of(context).settings.name;
              GetIt.I.get<PageNavMgr>().resetIndex();
              if (currentPath != PageName.ACCOUNT.path) {
                Navigator.popUntil(context, ModalRoute.withName(PageName.HOME.path));
                Navigator.pushNamed(context, PageName.ACCOUNT.path);
              } else {
                Navigator.pop(context);
              }             
            },
          ),
          ListTile(
            title: Text("Setting"),
            onTap: (){
              String currentPath = ModalRoute.of(context).settings.name;
              GetIt.I.get<PageNavMgr>().resetIndex();
              if (currentPath != PageName.SETTING.path) {
                Navigator.popUntil(context, ModalRoute.withName(PageName.HOME.path));
                Navigator.pushNamed(context, PageName.SETTING.path);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            title: Text("Logout"),
            onTap: (){
              GetIt.I.get<PageNavMgr>().resetIndex();
              Navigator.popUntil(context, ModalRoute.withName(PageName.HOME.path));
              Navigator.pushReplacementNamed(context, PageName.ROOT.path);           
            },
          )
        ]
      )
    );
  }

}