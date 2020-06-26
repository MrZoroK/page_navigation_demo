import 'package:flutter/material.dart';

import '../camera/camera_view.dart';
import '../common/page_animator.dart';

class CamerasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 10,
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
              Navigator.push(
                context,
                NoAnimPageRoute(
                  builder: (_) => CameraViewScreen(cameraId: index)
                )           
              );
            },
          );
        },
      ),
    );
  }
}