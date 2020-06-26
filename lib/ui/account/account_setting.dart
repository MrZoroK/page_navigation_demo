import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../common/page_animator.dart';
import '../common/page_name.dart';
import '../common/page_nav_mgr.dart';

class AccountSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageNavMgr pageNavMgr = GetIt.I.get<PageNavMgr>();
    return Scaffold(
      appBar: AppBar(
        title: Text(PageName.ACCOUNT_SETTING.name),
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
      body: WidgetAnimator(
        Center(
        child: Text(PageName.ACCOUNT_SETTING.name + " Screen"),
        )
      ),
      bottomNavigationBar: pageNavMgr.buildBottom(context, dynTab: PageName.ACCOUNT_SETTING),
    );
  }
}