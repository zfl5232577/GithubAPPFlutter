import 'package:flutter/material.dart';
import 'package:github_flutter/data/repos_model.dart';
import 'package:github_flutter/data/starred_model.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/resources/style.dart';
import 'package:github_flutter/widget/GSYUserIconWidget.dart';

class StarredItem extends StatelessWidget {
  final StarredModel starredModel;

  final VoidCallback onPressed;

  StarredItem(this.starredModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: FlatButton(
          padding: EdgeInsets.all(8.0),
          onPressed: onPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GSYUserIconWidget(
                    padding: EdgeInsets.all(0),
                    image:starredModel.owner.avatar_url,
                    width: 12,
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4,right: 8),
                      child:  Text(
                        starredModel.owner.login,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: MarkTextStyle.smallText,
                      ),
                    )
                  ),
                  Icon(
                    Icons.brightness_1,
                    size: 7,
                    color: Color(transLanguageColor(starredModel.language)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child:   Text(
                      starredModel.language==null?"":starredModel.language,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(transLanguageColor(starredModel.language)),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  starredModel.full_name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                starredModel.description==null?"(No description, website, or topics provided.)":starredModel.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: MarkTextStyle.smallSubText,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/ic_star_gray.png",
                      width: 12,
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2, right: 15),
                      child: Text(
                        starredModel.stargazers_count.toString(),
                        style: MarkTextStyle.smallSubText,
                      ),
                    ),
                    Image.asset(
                      "assets/images/ic_issue_gray.png",
                      width: 12,
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2, right: 15),
                      child: Text(
                        starredModel.open_issues_count.toString(),
                        style: MarkTextStyle.smallSubText,
                      ),
                    ),
                    Image.asset(
                      "assets/images/ic_fork_gray.png",
                      width: 12,
                      height: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2, right: 15),
                      child: Text(
                        starredModel.forks_count.toString(),
                        style: MarkTextStyle.smallSubText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  int transLanguageColor(String language) {
    if (language == null) return MarkColors.transparent;
    switch (language) {
      case "Kotlin":
        return MarkColors.color_language_kotlin;
      case "Java":
        return MarkColors.color_language_java;
      case "JavaScript":
        return MarkColors.color_language_js;
      case "Python":
        return MarkColors.color_language_python;
      case "HTML":
        return MarkColors.color_language_html;
      case "CSS":
        return MarkColors.color_language_css;
      case "Shell":
        return MarkColors.color_language_shell;
      case "C++":
        return MarkColors.color_language_cplus;
      case "C":
        return MarkColors.color_language_c;
      case "ruby":
        return MarkColors.color_language_ruby;
    }
    return MarkColors.color_language_other;
  }
}
