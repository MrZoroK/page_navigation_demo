import 'package:flutter/material.dart';
import 'package:menus_navigation_demo/ui/common/page_name.dart';

class PageNavMgr {
  int currentIdx = -1;

  String getPageTitle(BuildContext context) {
    var path = ModalRoute.of(context).settings.name;
    return pageNameByPath(path).name + " Screen";
  }

  Widget buildBottom(BuildContext context) {
    var path = ModalRoute.of(context).settings.name;
    var pageName = pageNameByPath(path);
    var activeColor = Colors.orange;
    var inactiveColor = Colors.grey;
    var tsInactiveTitle = TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    color: inactiveColor
                                  );
    var tsActiveTitle = TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    color: activeColor
                                  );

    var isCameraActive = pageName.index >= PageName.CAMERA_LIST.index && pageName.index <= PageName.CAMEAR_SETTING.index;
    var listNavBar = [
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket, color: inactiveColor, size: 32),
        title: Text('Shopping', style: (pageName == PageName.SHOPPING ? tsActiveTitle : tsInactiveTitle)),
        activeIcon: pageName == PageName.SHOPPING ? Icon(Icons.shopping_basket, color: activeColor, size: 32) : null,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera_alt, color: inactiveColor, size: 32),
        title: Text('Camera', style: (isCameraActive ? tsActiveTitle : tsInactiveTitle)),
        activeIcon: isCameraActive ? Icon(Icons.camera_alt, color: activeColor, size: 32) : null
      ),
    ];

    //Dynamic tab
    if (pageName != PageName.HOME && pageName != PageName.SHOPPING && pageName != PageName.CAMERA_LIST) {
      String title = pageName.name;
      if (pageName == PageName.CAMERA_VIEW || pageName == PageName.CAMEAR_SETTING) {
        final cameraId = ModalRoute.of(context).settings.arguments;
        title = "Camera $cameraId";
      }
      listNavBar.add(BottomNavigationBarItem(
        icon: Icon(Icons.category, color: inactiveColor, size: 32),
        title: Text(title, style: tsInactiveTitle),
      ));
    }

    return Card (
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIdx < 0 ? 0 : currentIdx,
        onTap: (idx) => onTapButtonNavBarItem(context, idx),
        items: listNavBar
      )
    );
  }

  resetIndex() {
    currentIdx = -1;
  }

  onTapButtonNavBarItem(BuildContext context, int idx) {
    if (idx == 2) {
      return;
    }

    if (currentIdx == -1) { 
      Navigator.popUntil(context, ModalRoute.withName(PageName.HOME.path));     
    } else if (currentIdx == 0) {
      Navigator.popUntil(context, ModalRoute.withName(PageName.SHOPPING.path));
    } else if (currentIdx == 1) {
      Navigator.popUntil(context, ModalRoute.withName(PageName.CAMERA_LIST.path));
    }
    
    if (currentIdx != idx) {
      if (idx == 0) {
        Navigator.pushNamed(context, PageName.SHOPPING.path);
      } else if (idx == 1) {
        Navigator.pushNamed(context, PageName.CAMERA_LIST.path);
      }
      currentIdx = idx;
    }
  }
}