import 'package:flutter/material.dart';
import 'package:menus_navigation_demo/ui/common/page_name.dart';

class PageNavMgr {
  static const HOME = "/home";
  PageController pageController;
  PageName dynamicTab;

  int currentIdx = 0;

  Widget buildBottom(BuildContext context, {PageController pageCtrler, PageName dynTab, int initIdx}) {

    if (dynTab != null) {
      dynamicTab = dynTab;
    }
    if (initIdx != null) {
      currentIdx = initIdx;
    }
    if (pageCtrler != null) {
      pageController = pageCtrler;
    }

    var activeColor = Colors.orange;
    var inactiveColor = Colors.grey;
    var tsInactiveTitle = TextStyle(fontSize: 12,fontFamily: 'Roboto',color: inactiveColor);
    var tsActiveTitle = TextStyle(fontSize: 12, fontFamily: 'Roboto', color: activeColor);

    //Dynamic tab
    var listNavBar = List<BottomNavigationBarItem>();
    int tabIdx = currentIdx;
    if (dynamicTab != PageName.HOME) {
      tabIdx = 2;
      listNavBar.add(BottomNavigationBarItem(
        icon: Icon(Icons.category, color: inactiveColor, size: 32),
        title: Text(dynamicTab.name, style: tsActiveTitle),
        activeIcon: Icon(Icons.category, color: activeColor, size: 32)
      ));
    }

    listNavBar.insertAll(0, [
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket, color: inactiveColor, size: 32),
        title: Text('Shopping', style: (tabIdx == 0 ? tsActiveTitle : tsInactiveTitle)),
        activeIcon: tabIdx == 0 ? Icon(Icons.shopping_basket, color: activeColor, size: 32) : null,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera_alt, color: inactiveColor, size: 32),
        title: Text('Camera', style: (tabIdx == 1 ? tsActiveTitle : tsInactiveTitle)),
        activeIcon: tabIdx == 1 ? Icon(Icons.camera_alt, color: activeColor, size: 32) : null
      ),
    ]);
    

    return Card (
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIdx,
        onTap: (idx) => onTapButtonNavBarItem(context, idx, pageController: pageController),
        items: listNavBar
      )
    );
  }

  onTapButtonNavBarItem(BuildContext context, int idx, {PageController pageController}) {
    if (idx == 2) {
      return;
    }

    if (currentIdx != idx || dynamicTab != PageName.HOME) {
      dynamicTab = PageName.HOME;
      Navigator.popUntil(context, ModalRoute.withName('/home'));
      pageController?.animateToPage(idx, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      currentIdx = idx;      
    }
  }
}