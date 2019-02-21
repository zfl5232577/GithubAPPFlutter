import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:github_flutter/base/constant.dart';
import 'package:github_flutter/module/network/address.dart';
import 'package:github_flutter/module/network/Api.dart';
import 'package:github_flutter/main.dart';

class EventDao{
  getEventReceived({page = 1}) async{
    Map<String, Object> params = new HashMap();
    params.putIfAbsent("page", ()=>page);
    params.putIfAbsent("per_page", ()=>Constant.PAGE_SIZE);
    return await HttpManager.netFetch(Address.getEventReceived(userDao.getUserName()), params,
        null, new Options(method: "get"));
  }
}