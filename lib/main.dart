import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/dao/userdao.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/utils/shared_preferences.dart';
import 'package:github_flutter/views/login_page/login_page.dart';
import 'package:github_flutter/views/main_page/main_page.dart';

SpUtil sp;
UserDao userDao;
var db;

class MyApp extends StatelessWidget {
  MyApp() {
//    final router = new Router();
//    Routes.configureRoutes(router);
//    Application.router = router;
  }

  showAppPage() {
    if (!userDao.checkLogin()) {
      return LoginPage();
    } else {
      return MainPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new MaterialApp(
      title: 'GitHubF',
      theme: new ThemeData(
        primaryColor: Color(MarkColors.ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(MarkColors.ThemeColor),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(MarkColors.TextColor), fontSize: 14.0),
        ),
        iconTheme: IconThemeData(
          color: Color(MarkColors.ThemeColor),
          size: 35.0,
        ),
      ),
      home: showAppPage(),
//      onGenerateRoute: Application.router.generator,
    );
  }
}

void main() async {
//  final provider = new Provider();
//  await provider.init(true);
  sp = await SpUtil.instance;
  userDao = await UserDao.getInstance();
//  db = Provider.db;
  runApp(new MyApp());
}
