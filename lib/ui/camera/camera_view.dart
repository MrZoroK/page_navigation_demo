import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../camera/camera_setting.dart';
import '../common/page_animator.dart';
import '../common/drawer.dart';
import '../common/page_name.dart';
import '../common/page_nav_mgr.dart';

class CameraViewScreen extends StatelessWidget {
  final int cameraId;
  CameraViewScreen({@required this.cameraId});

  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(title: Text(PageName.CAMERA_VIEW.name)),
      drawer: DemoDrawer(),
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
                Navigator.push(
                  context,
                  NoAnimPageRoute(
                    builder: (_) => CameraSettingScreen(cameraId: cameraId)
                  )           
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text("Camera View $cameraId"),
            )
          ],
        )
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context, dynTab: PageName.CAMERA_VIEW),
    );
  }

}