import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menus_navigation_demo/ui/common/page_name.dart';
import 'package:menus_navigation_demo/ui/common/page_nav_mgr.dart';
import 'package:menus_navigation_demo/ui/home/camera.dart';

import '../common/drawer.dart';
import 'shopping.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  final _pagePositionUpdater = StreamController<int>.broadcast();
  void _onPageScroll() {
    double pagePos = _pageController.page;
      if (pagePos - pagePos.floorToDouble() == 0) {
        _pagePositionUpdater.sink.add(pagePos.floor());
      }
  }

  @override
  void dispose() {
    _pagePositionUpdater.close();
    super.dispose();
  }

  @override
  void initState() {
    _pageController.addListener(_onPageScroll);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();

    return Scaffold(
      appBar: AppBar(title: Text(PageName.HOME.name)),
      body: PageView.builder(
        itemCount: 2,
        controller: _pageController,
        scrollDirection: Axis.horizontal,        
        itemBuilder: (context, index) {
          if (index == 0) {
            return ShoppingPage();
          } else {
            return CamerasPage();
          }
        },
      ),
      drawer: DemoDrawer(),
      bottomNavigationBar: StreamBuilder(
        stream: _pagePositionUpdater.stream,
        builder: (context, snapshot) {
          int currentPage = 0;
          if (snapshot.hasData) {
            currentPage = snapshot.data;
          }
          return pageNavMgr.buildBottom(
            context, pageCtrler: _pageController,
            dynTab: PageName.HOME, initIdx: currentPage);
        }
      )
    );
  }
}