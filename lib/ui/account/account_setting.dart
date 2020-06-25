import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../common/page_nav_mgr.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(
        title: Text(pageNavMgr.getPageTitle(context)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          }
        ),
      ),
      body: Center(
        child: Text("Account Setting"),
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
}