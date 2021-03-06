import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_flutter/base/constant.dart';

import 'dart:collection';
import 'package:github_flutter/main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:github_flutter/module/network/Code.dart';
import 'package:github_flutter/module/network/ResultData.dart';
import 'package:github_flutter/utils/log_utils.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static netFetch(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: "none network", toastLength: Toast.LENGTH_LONG);
      return new ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
          false,
          Code.NETWORK_ERROR);
    }

    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    //授权码
    if (optionParams["authorizationCode"] == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        optionParams["authorizationCode"] = authorizationCode;
      }
    }

    headers["Authorization"] = optionParams["authorizationCode"];

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = 15000;

    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        Fluttertoast.showToast(
            msg: "network error", toastLength: Toast.LENGTH_LONG);
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        Fluttertoast.showToast(
            msg: "network timeout", toastLength: Toast.LENGTH_LONG);
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Constant.DEBUG) {
        MLog.i('请求异常: ' + e.toString());
        MLog.i('请求异常url: ' + url);
      }
      return new ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    if (Constant.DEBUG) {
      MLog.i('请求url: ' + url);
      MLog.i('请求头: ' + option.headers.toString());
      if (params != null) {
        MLog.i('请求参数: ' + params.toString());
      }
      if (response != null) {
        MLog.i('返回参数: ' + response.toString());
      }
      if (optionParams["authorizationCode"] != null) {
        MLog.i('authorizationCode: ' + optionParams["authorizationCode"]);
      }
    }

    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      } else {
        var responseJson = response.data;
        if (response.statusCode == 201 && responseJson["token"] != null) {
          optionParams["authorizationCode"] = 'token ' + responseJson["token"];
          await sp.putString(
              SharedPreferencesKeys.token, optionParams["authorizationCode"]);
        }
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }
    Fluttertoast.showToast(
        msg: "request abnormal", toastLength: Toast.LENGTH_LONG);
    return new ResultData(
        Code.errorHandleFunction(response.statusCode, "", noTip),
        false,
        response.statusCode);
  }

  ///清除授权
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    sp.remove(SharedPreferencesKeys.token);
  }

  ///获取授权
  static getAuthorization() async {
    String token = await sp.get(SharedPreferencesKeys.token);
    if (token == null) {
      String basic = await sp.get(SharedPreferencesKeys.authorization);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return basic;
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }
}
