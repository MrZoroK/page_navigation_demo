import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../common/drawer.dart';
import '../common/page_name.dart';
import '../common/page_nav_mgr.dart';

class CameraViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    final cameraId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(pageNavMgr.getPageTitle(context))),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.settings, color: Colors.blue,
                size: 60,
              ),
              onPressed: (){
                Navigator.pushNamed(context, PageName.CAMEAR_SETTING.path, arguments: cameraId);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Camera View $cameraId"),
            )
          ],
        )
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }

}