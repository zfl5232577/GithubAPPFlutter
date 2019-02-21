
import 'package:github_flutter/base/constant.dart';

class Address {
  static const String host = "https://api.github.com/";

  static getLogin() {
    return "${host}user";
  }

  static getEventReceived(userName){
    return "${host}users/$userName/received_events";
  }

  static getRepositoriesList(userName){
    return "${host}users/$userName/repos";
  }

  static getStarredList(userName){
    return "${host}users/$userName/starred";
  }

  ///处理分页参数
  static getPageParams(tab, page, [pageSize = Constant.PAGE_SIZE]) {
    if (page != null) {
      if (pageSize != null) {
        return "${tab}page=$page&per_page=$pageSize";
      } else {
        return "${tab}page=$page";
      }
    } else {
      return "";
    }
  }
}