enum PageName {
  ROOT,
  HOME,
  SETTING,
  SHOPPING,
  CAMERA_LIST,
  CAMERA_VIEW,
  CAMEAR_SETTING,
  ACCOUNT,
  ACCOUNT_SETTING
}

  PageName pageNameByPath(String path) {
    for(int i = PageName.values.length - 1; i >= 0; i--) {
      var pageName = PageName.values[i];
      if (path.contains(pageName.path)) {
        return pageName;
      }
    }
    throw Exception("Invalid path: $path");
  }

extension PageNameExt on PageName {
  String get name {
    switch(this) {      
      case PageName.ROOT:
        return "Splash";
      case PageName.HOME:
        return "Home";
      case PageName.SETTING:
        return "Setting";
      case PageName.SHOPPING:
        return "Shopping";
      case PageName.CAMERA_LIST:
        return "Camera List";
      case PageName.ACCOUNT:
        return "Account";
      case PageName.ACCOUNT_SETTING:
        return "Account Setting";
      case PageName.CAMERA_VIEW:
        return "Camera View";
      case PageName.CAMEAR_SETTING:
        return "Camera Setting";
    }
    throw Exception("Not Implemented");
  }
  String get path {
    switch(this) {
      case PageName.ROOT:
        return '/';
      case PageName.HOME:
        return 'home';
      case PageName.SETTING:
        return PageName.HOME.path + '/setting';
      case PageName.SHOPPING:
        return PageName.HOME.path + '/shopping';
      case PageName.ACCOUNT:
        return PageName.HOME.path + '/account';
      case PageName.ACCOUNT_SETTING:
        return PageName.ACCOUNT.path + '/setting';
      case PageName.CAMERA_LIST:
        return PageName.HOME.path + '/camera_list';
      case PageName.CAMERA_VIEW:
        return PageName.CAMERA_LIST.path + '/camera_view';
      case PageName.CAMEAR_SETTING:
        return PageName.CAMERA_VIEW.path + '/camera_view_setting';
    }
    throw Exception("Not Implemented");
  }
}