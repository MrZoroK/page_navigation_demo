enum PageName {
  ROOT,
  HOME,
  SETTING,
  SHOPPING,
  CAMERA_VIEW,
  CAMEAR_SETTING,
  ACCOUNT,
  ACCOUNT_SETTING
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
}