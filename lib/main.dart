import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:menus_navigation_demo/ui/common/page_animator.dart';
import 'ui/common/page_nav_mgr.dart';

import 'ui/home/home.dart';
import 'ui/splash.dart';

void main() {
  GetIt.I.registerSingleton(PageNavMgr());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        PageNavMgr.HOME: (context) => HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PageNavMgr.HOME) {
          return NoAnimPageRoute(builder: (_) => HomeScreen());
        } else {
          return NoAnimPageRoute(builder: (_) => SplashScreen());
        }
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.cyanAccent,
      ),
    );
  }
}