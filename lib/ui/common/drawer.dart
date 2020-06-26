import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../account/account.dart';
import '../setting.dart';
import 'page_nav_mgr.dart';
import 'page_animator.dart';
import 'page_name.dart';

class DemoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Account"),
            onTap: (){
              if (GetIt.I.get<PageNavMgr>().dynamicTab != PageName.ACCOUNT) {
                Navigator.popUntil(context, ModalRoute.withName(PageNavMgr.HOME));
                Navigator.push(
                  context, NoAnimPageRoute(
                    builder: (_) => AccountScreen()
                  )
                );
              } else {
                Navigator.pop(context);
              }             
            },
          ),
          ListTile(
            title: Text("Setting"),
            onTap: (){
              if (GetIt.I.get<PageNavMgr>().dynamicTab != PageName.SETTING) {
                Navigator.popUntil(context, ModalRoute.withName(PageNavMgr.HOME));
                Navigator.push(
                  context, NoAnimPageRoute(
                    builder: (_) => SettingScreen()
                  )
                );
              }else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            title: Text("Logout"),
            onTap: (){
              Navigator.popUntil(context, ModalRoute.withName(PageNavMgr.HOME));
              Navigator.pushReplacementNamed(context, '/');           
            },
          )
        ]
      )
    );
  }

}