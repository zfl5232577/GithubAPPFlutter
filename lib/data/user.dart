import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  String login;
  String node_id;
  String avatar_url;
  String gravatar_id;
  String url;
  String html_url;
  String followers_url;
  String following_url;
  String gists_url;
  String starred_url;
  String subscriptions_url;
  String organizations_url;
  String repos_url;
  String events_url;
  String received_events_url;
  String type;
  String name;
  String company;
  String blog;
  String location;
  String email;
  String hireable;
  String bio;
  String created_at;
  String updated_at;
  bool site_admin;
  bool two_factor_authentication;
  int id;
  int public_repos;
  int public_gists;
  int followers;
  int following;
  int private_gists;
  int total_private_repos;
  int owned_private_repos;
  int disk_usage;
  int collaborators;
  PlanBean plan;

  static User fromMap(Map<String, dynamic> map) {
    User user = new User();
    user.login = map['login'];
    user.node_id = map['node_id'];
    user.avatar_url = map['avatar_url'];
    user.gravatar_id = map['gravatar_id'];
    user.url = map['url'];
    user.html_url = map['html_url'];
    user.followers_url = map['followers_url'];
    user.following_url = map['following_url'];
    user.gists_url = map['gists_url'];
    user.starred_url = map['starred_url'];
    user.subscriptions_url = map['subscriptions_url'];
    user.organizations_url = map['organizations_url'];
    user.repos_url = map['repos_url'];
    user.events_url = map['events_url'];
    user.received_events_url = map['received_events_url'];
    user.type = map['type'];
    user.name = map['name'];
    user.company = map['company'];
    user.blog = map['blog'];
    user.location = map['location'];
    user.email = map['email'];
    user.hireable = map['hireable'];
    user.bio = map['bio'];
    user.created_at = map['created_at'];
    user.updated_at = map['updated_at'];
    user.site_admin = map['site_admin'];
    user.two_factor_authentication = map['two_factor_authentication'];
    user.id = map['id'];
    user.public_repos = map['public_repos'];
    user.public_gists = map['public_gists'];
    user.followers = map['followers'];
    user.following = map['following'];
    user.private_gists = map['private_gists'];
    user.total_private_repos = map['total_private_repos'];
    user.owned_private_repos = map['owned_private_repos'];
    user.disk_usage = map['disk_usage'];
    user.collaborators = map['collaborators'];
    user.plan = PlanBean.fromMap(map['plan']);
    return user;
  }

  static List<User> fromMapList(dynamic mapList) {
    List<User> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class PlanBean {

  String name;
  int space;
  int collaborators;
  int private_repos;

  static PlanBean fromMap(Map<String, dynamic> map) {
    PlanBean planBean = new PlanBean();
    planBean.name = map['name'];
    planBean.space = map['space'];
    planBean.collaborators = map['collaborators'];
    planBean.private_repos = map['private_repos'];
    return planBean;
  }

  static List<PlanBean> fromMapList(dynamic mapList) {
    List<PlanBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
