import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/base/constant.dart';
import 'package:github_flutter/dao/userdao.dart';
import 'package:github_flutter/main.dart';
import 'package:github_flutter/utils/common_utils.dart';
import 'package:github_flutter/views/navigator_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_launcher.png',
                      width: 65,
                      height: 65,
                    ),
                    Text('  Signin to GitHub',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ))
                  ],
                ),
              ),
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(12.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            CommonUtils.showLoadingDialog(context);
                            UserDao.getInstance().then((UserDao dao) {
                              dao
                                  .login(_unameController.text,
                                      _pwdController.text)
                                  .then((res) {
                                Navigator.pop(context);
                                if (res != null && res.result) {
                                  NavigatorUtils.goHome(context);
                                  sp.putBool(
                                      SharedPreferencesKeys.isLogin, true);
                                  sp.putString(SharedPreferencesKeys.userInfo,
                                      json.encode(res.data));
                                } else {
                                  if(res.code == 401){
                                    Fluttertoast.showToast(msg: "username or password error",toastLength:Toast.LENGTH_LONG);
                                  }
                                }
                              });
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
