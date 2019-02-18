import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_flutter/base/constant.dart';
import 'package:github_flutter/data/user.dart';
import 'package:github_flutter/main.dart';
import 'package:github_flutter/module/network/Api.dart';
import 'package:github_flutter/module/network/address.dart';

class UserDao {
  static UserDao _instance;
  bool isLogin;
  User userInfo;

  static Future<UserDao> get instance async {
    return await getInstance();
  }

  UserDao._();

  Future _init() async {
    isLogin = await sp.get(SharedPreferencesKeys.isLogin);
    var userText = await sp.get(SharedPreferencesKeys.userInfo);
    if (isLogin != null && isLogin && userText != null) {
      var userMap = json.decode(userText);
      userInfo = User.fromMap(userMap);
    }
  }

  static Future<UserDao> getInstance() async {
    if (_instance == null) {
      _instance = new UserDao._();
      await _instance._init();
    }
    return _instance;
  }

  login(userName, password) async {
    String type = userName + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    await sp.putString(SharedPreferencesKeys.authorization, base64Str);

    Map requestParams = {
//      "scopes": ['user', 'repo', 'gist', 'notifications'],
//      "note": "admin_script",
//      "client_id": 'client_id',
//      "client_secret": 'client_secret'
    };
    HttpManager.clearAuthorization();
    return await HttpManager.netFetch(Address.login, json.encode(requestParams),
        null, new Options(method: "get"));
  }

  bool checkLogin() {
    return isLogin != null && isLogin && userInfo != null;
  }

//    ///读取主题
//    String themeIndex = await LocalStorage.get(Config.THEME_COLOR);
//    if (themeIndex != null && themeIndex.length != 0) {
//      CommonUtils.pushTheme(store, int.parse(themeIndex));
//    }
//
//    ///切换语言
//    String localeIndex = await LocalStorage.get(Config.LOCALE);
//    if (localeIndex != null && localeIndex.length != 0) {
//      CommonUtils.changeLocale(store, int.parse(localeIndex));
//    }
//
//    return new DataResult(res.data, (res.result && (token != null)));
//  }

//
//  ///获取用户详细信息
//  static getUserInfo(userName, {needDb = false}) async {
//    UserInfoDbProvider provider = new UserInfoDbProvider();
//    next() async {
//      var res;
//      if (userName == null) {
//        res = await HttpManager.netFetch(Address.getMyUserInfo(), null, null, null);
//      } else {
//        res = await HttpManager.netFetch(Address.getUserInfo(userName), null, null, null);
//      }
//      if (res != null && res.result) {
//        String starred = "---";
//        if (res.data["type"] != "Organization") {
//          var countRes = await getUserStaredCountNet(res.data["login"]);
//          if (countRes.result) {
//            starred = countRes.data;
//          }
//        }
//        User user = User.fromJson(res.data);
//        user.starred = starred;
//        if (userName == null) {
//          LocalStorage.save(Config.USER_INFO, json.encode(user.toJson()));
//        } else {
//          if (needDb) {
//            provider.insert(userName, json.encode(user.toJson()));
//          }
//        }
//        return new DataResult(user, true);
//      } else {
//        return new DataResult(res.data, false);
//      }
//    }
//
//    if (needDb) {
//      User user = await provider.getUserInfo(userName);
//      if (user == null) {
//        return await next();
//      }
//      DataResult dataResult = new DataResult(user, true, next: next());
//      return dataResult;
//    }
//    return await next();
//  }
//
//  static clearAll(Store store) async {
//    HttpManager.clearAuthorization();
//    LocalStorage.remove(Config.USER_INFO);
//    store.dispatch(new UpdateUserAction(User.empty()));
//  }
//
//  /**
//   * 在header中提起stared count
//   */
//  static getUserStaredCountNet(userName) async {
//    String url = Address.userStar(userName, null) + "&per_page=1";
//    var res = await HttpManager.netFetch(url, null, null, null);
//    if (res != null && res.result && res.headers != null) {
//      try {
//        List<String> link = res.headers['link'];
//        if (link != null) {
//          int indexStart = link[0].lastIndexOf("page=") + 5;
//          int indexEnd = link[0].lastIndexOf(">");
//          if (indexStart >= 0 && indexEnd >= 0) {
//            String count = link[0].substring(indexStart, indexEnd);
//            return new DataResult(count, true);
//          }
//        }
//      } catch (e) {
//        print(e);
//      }
//    }
//    return new DataResult(null, false);
//  }
//
//  /**
//   * 获取用户粉丝列表
//   */
//  static getFollowerListDao(userName, page, {needDb = false}) async {
//    UserFollowerDbProvider provider = new UserFollowerDbProvider();
//
//    next() async {
//      String url = Address.getUserFollower(userName) + Address.getPageParams("?", page);
//      var res = await HttpManager.netFetch(url, null, null, null);
//      if (res != null && res.result) {
//        List<User> list = new List();
//        var data = res.data;
//        if (data == null || data.length == 0) {
//          return new DataResult(null, false);
//        }
//        for (int i = 0; i < data.length; i++) {
//          list.add(new User.fromJson(data[i]));
//        }
//        if (needDb) {
//          provider.insert(userName, json.encode(data));
//        }
//        return new DataResult(list, true);
//      } else {
//        return new DataResult(null, false);
//      }
//    }
//
//    if (needDb) {
//      List<User> list = await provider.geData(userName);
//      if (list == null) {
//        return await next();
//      }
//      DataResult dataResult = new DataResult(list, true, next: next());
//      return dataResult;
//    }
//    return await next();
//  }
//
//  /**
//   * 获取用户关注列表
//   */
//  static getFollowedListDao(userName, page, {needDb = false}) async {
//    UserFollowedDbProvider provider = new UserFollowedDbProvider();
//    next() async {
//      String url = Address.getUserFollow(userName) + Address.getPageParams("?", page);
//      var res = await HttpManager.netFetch(url, null, null, null);
//      if (res != null && res.result) {
//        List<User> list = new List();
//        var data = res.data;
//        if (data == null || data.length == 0) {
//          return new DataResult(null, false);
//        }
//        for (int i = 0; i < data.length; i++) {
//          list.add(new User.fromJson(data[i]));
//        }
//        if (needDb) {
//          provider.insert(userName, json.encode(data));
//        }
//        return new DataResult(list, true);
//      } else {
//        return new DataResult(null, false);
//      }
//    }
//
//    if (needDb) {
//      List<User> list = await provider.geData(userName);
//      if (list == null) {
//        return await next();
//      }
//      DataResult dataResult = new DataResult(list, true, next: next());
//      return dataResult;
//    }
//    return await next();
//  }
//
//  /**
//   * 获取用户相关通知
//   */
//  static getNotifyDao(bool all, bool participating, page) async {
//    String tag = (!all && !participating) ? '?' : "&";
//    String url = Address.getNotifation(all, participating) + Address.getPageParams(tag, page);
//    var res = await HttpManager.netFetch(url, null, null, null);
//    if (res != null && res.result) {
//      List<Notification> list = new List();
//      var data = res.data;
//      if (data == null || data.length == 0) {
//        return new DataResult([], true);
//      }
//      for (int i = 0; i < data.length; i++) {
//        list.add(Notification.fromJson(data[i]));
//      }
//      return new DataResult(list, true);
//    } else {
//      return new DataResult(null, false);
//    }
//  }
//
//  /**
//   * 设置单个通知已读
//   */
//  static setNotificationAsReadDao(id) async {
//    String url = Address.setNotificationAsRead(id);
//    var res = await HttpManager.netFetch(url, null, null, new Options(method: "PATCH"), noTip: true);
//    return res;
//  }
//
//  /**
//   * 设置所有通知已读
//   */
//  static setAllNotificationAsReadDao() async {
//    String url = Address.setAllNotificationAsRead();
//    var res = await HttpManager.netFetch(url, null, null, new Options(method: "PUT", contentType: ContentType.text));
//    return new DataResult(res.data, res.result);
//  }
//
//  /**
//   * 检查用户关注状态
//   */
//  static checkFollowDao(name) async {
//    String url = Address.doFollow(name);
//    var res = await HttpManager.netFetch(url, null, null, new Options(contentType: ContentType.text), noTip: true);
//    return new DataResult(res.data, res.result);
//  }
//
//  /**
//   * 关注用户
//   */
//  static doFollowDao(name, bool followed) async {
//    String url = Address.doFollow(name);
//    var res = await HttpManager.netFetch(url, null, null, new Options(method: !followed ? "PUT" : "DELETE"), noTip: true);
//    return new DataResult(res.data, res.result);
//  }
//
//  /**
//   * 组织成员
//   */
//  static getMemberDao(userName, page) async {
//    String url = Address.getMember(userName) + Address.getPageParams("?", page);
//    var res = await HttpManager.netFetch(url, null, null, null);
//    if (res != null && res.result) {
//      List<User> list = new List();
//      var data = res.data;
//      if (data == null || data.length == 0) {
//        return new DataResult(null, false);
//      }
//      for (int i = 0; i < data.length; i++) {
//        list.add(new User.fromJson(data[i]));
//      }
//      return new DataResult(list, true);
//    } else {
//      return new DataResult(null, false);
//    }
//  }
//
//  /**
//   * 更新用户信息
//   */
//  static updateUserDao(params, Store store) async {
//    String url = Address.getMyUserInfo();
//    var res = await HttpManager.netFetch(url, params, null, new Options(method: "PATCH"));
//    if (res != null && res.result) {
//      var localResult = await getUserInfoLocal();
//      User newUser = User.fromJson(res.data);
//      newUser.starred = localResult.data.starred;
//      await LocalStorage.save(Config.USER_INFO, json.encode(newUser.toJson()));
//      store.dispatch(new UpdateUserAction(newUser));
//      return new DataResult(newUser, true);
//    }
//    return new DataResult(null, false);
//  }
//
//  /**
//   * 获取用户组织
//   */
//  static getUserOrgsDao(userName, page, {needDb = false}) async {
//    UserOrgsDbProvider provider = new UserOrgsDbProvider();
//    next() async {
//      String url = Address.getUserOrgs(userName) + Address.getPageParams("?", page);
//      var res = await HttpManager.netFetch(url, null, null, null);
//      if (res != null && res.result) {
//        List<UserOrg> list = new List();
//        var data = res.data;
//        if (data == null || data.length == 0) {
//          return new DataResult(null, false);
//        }
//        for (int i = 0; i < data.length; i++) {
//          list.add(new UserOrg.fromJson(data[i]));
//        }
//        if (needDb) {
//          provider.insert(userName, json.encode(data));
//        }
//        return new DataResult(list, true);
//      } else {
//        return new DataResult(null, false);
//      }
//    }
//
//    if (needDb) {
//      List<UserOrg> list = await provider.geData(userName);
//      if (list == null) {
//        return await next();
//      }
//      DataResult dataResult = new DataResult(list, true, next: next());
//      return dataResult;
//    }
//    return await next();
//  }
}
