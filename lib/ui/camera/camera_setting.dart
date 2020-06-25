
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../common/page_nav_mgr.dart';

class CameraSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    final cameraId = ModalRoute.of(context).settings.arguments;
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
        child: Text(
          "Camera $cameraId Setting"
        ),
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context),
    );
  }
  
}