import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventModel {

  /**
   * id : "9098690823"
   * type : "WatchEvent"
   * created_at : "2019-02-20T01:02:09Z"
   * public : true
   * actor : {"id":5214214,"login":"drakeet","display_login":"drakeet","gravatar_id":"","url":"https://api.github.com/users/drakeet","avatar_url":"https://avatars.githubusercontent.com/u/5214214?"}
   * org : {"id":1961952,"login":"alibaba","gravatar_id":"","url":"https://api.github.com/orgs/alibaba","avatar_url":"https://avatars.githubusercontent.com/u/1961952?"}
   * payload : {"action":"started"}
   * repo : {"id":164608222,"name":"alibaba/flutter-go","url":"https://api.github.com/repos/alibaba/flutter-go"}
   */

  String id;
  String type;
  String created_at;
  bool public;
  ActorBean actor;
  OrgBean org;
  PayloadBean payload;
  RepoBean repo;

  static EventModel fromMap(Map<String, dynamic> map) {
    EventModel event_model = new EventModel();
    event_model.id = map['id'];
    event_model.type = map['type'];
    event_model.created_at = map['created_at'];
    event_model.public = map['public'];
    event_model.actor = ActorBean.fromMap(map['actor']);
    event_model.org = OrgBean.fromMap(map['org']);
    event_model.payload = PayloadBean.fromMap(map['payload']);
    event_model.repo = RepoBean.fromMap(map['repo']);
    return event_model;
  }

  static List<EventModel> fromMapList(dynamic mapList) {
    List<EventModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class ActorBean {

  /**
   * login : "drakeet"
   * display_login : "drakeet"
   * gravatar_id : ""
   * url : "https://api.github.com/users/drakeet"
   * avatar_url : "https://avatars.githubusercontent.com/u/5214214?"
   * id : 5214214
   */

  String login;
  String display_login;
  String gravatar_id;
  String url;
  String avatar_url;
  int id;

  static ActorBean fromMap(Map<String, dynamic> map) {
    ActorBean actorBean = new ActorBean();
    actorBean.login = map['login'];
    actorBean.display_login = map['display_login'];
    actorBean.gravatar_id = map['gravatar_id'];
    actorBean.url = map['url'];
    actorBean.avatar_url = map['avatar_url'];
    actorBean.id = map['id'];
    return actorBean;
  }

  static List<ActorBean> fromMapList(dynamic mapList) {
    List<ActorBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class OrgBean {

  /**
   * login : "alibaba"
   * gravatar_id : ""
   * url : "https://api.github.com/orgs/alibaba"
   * avatar_url : "https://avatars.githubusercontent.com/u/1961952?"
   * id : 1961952
   */

  String login;
  String gravatar_id;
  String url;
  String avatar_url;
  int id;

  static OrgBean fromMap(Map<String, dynamic> map) {
    if(map==null){
      return null;
    }
    OrgBean orgBean = new OrgBean();
    orgBean.login = map['login'];
    orgBean.gravatar_id = map['gravatar_id'];
    orgBean.url = map['url'];
    orgBean.avatar_url = map['avatar_url'];
    orgBean.id = map['id'];
    return orgBean;
  }

  static List<OrgBean> fromMapList(dynamic mapList) {
    List<OrgBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class PayloadBean {

  /**
   * action : "started"
   */

  String action;

  static PayloadBean fromMap(Map<String, dynamic> map) {
    if(map==null){
      return null;
    }
    PayloadBean payloadBean = new PayloadBean();
    payloadBean.action = map['action'];
    return payloadBean;
  }

  static List<PayloadBean> fromMapList(dynamic mapList) {
    List<PayloadBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class RepoBean {

  /**
   * name : "alibaba/flutter-go"
   * url : "https://api.github.com/repos/alibaba/flutter-go"
   * id : 164608222
   */

  String name;
  String url;
  int id;

  static RepoBean fromMap(Map<String, dynamic> map) {
    RepoBean repoBean = new RepoBean();
    repoBean.name = map['name'];
    repoBean.url = map['url'];
    repoBean.id = map['id'];
    return repoBean;
  }

  static List<RepoBean> fromMapList(dynamic mapList) {
    List<RepoBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
