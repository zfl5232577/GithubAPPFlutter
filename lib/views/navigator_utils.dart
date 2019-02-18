import 'package:flutter/material.dart';
import 'package:github_flutter/views/main_page/main_page.dart';

class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (context) {
      return MainPage();
    }));
  }
}
