import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common/page_nav_mgr.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    if (_timer == null || !_timer.isActive) {
      _timer = Timer.periodic(Duration(seconds: 2), (timer) {
        Navigator.pushReplacementNamed(context, PageNavMgr.HOME);
        _timer.cancel();
      });
    }
    return Scaffold(      
      body: Center(
        child: Text("Splash Screen", style: TextStyle(fontSize: 17, color: Colors.black))
      )
    );
  }
}