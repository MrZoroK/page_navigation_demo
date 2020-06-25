import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../common/page_nav_mgr.dart';
import '../common/drawer.dart';
import '../common/page_name.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(pageNavMgr.getPageTitle(context))),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.settings, color: Colors.blue,
                size: 60,
              ),
              onPressed: (){
                Navigator.pushNamed(context, PageName.ACCOUNT_SETTING.path);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Account", textAlign: TextAlign.center),
            )
          ],
        )
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
}