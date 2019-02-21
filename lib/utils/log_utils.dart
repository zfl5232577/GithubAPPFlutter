import 'package:github_flutter/base/constant.dart';

class MLog {
  static bool isDebug = Constant.DEBUG;

  static i(String log) {
    if(isDebug && log.isNotEmpty){
      if(log.length>1023){
        print(log.substring(0,1023));
        i(log.substring(1023));
      }else{
        print(log);
      }
    }
  }
}
