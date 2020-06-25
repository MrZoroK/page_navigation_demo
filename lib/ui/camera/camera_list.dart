import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../common/drawer.dart';
import '../common/page_name.dart';
import '../common/page_nav_mgr.dart';

class CameraListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(pageNavMgr.getPageTitle(context))),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return FlatButton(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              alignment: Alignment.center,
              child: Text(
                "Camera " + index.toString(),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                border: Border.all()
              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, PageName.CAMERA_VIEW.path, arguments: index);
            },
          );
        },
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
}