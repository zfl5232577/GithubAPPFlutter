import 'package:flutter/material.dart';
import 'package:github_flutter/data/repos_model.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/resources/style.dart';
import 'package:github_flutter/views/test/GSYIConText.dart';
import 'package:github_flutter/views/test/GSYUserIconWidget.dart';
import 'package:github_flutter/widget/GSYCardItem.dart';
/**
 * 仓库Item
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class ReposItem1111 extends StatelessWidget {
  final ReposViewModel reposViewModel;

  final VoidCallback onPressed;

  ReposItem1111(this.reposViewModel, {this.onPressed}) : super();

  ///仓库item的底部状态，比如star数量等
  _getBottomItem(IconData icon, String text, {int flex = 2}) {
    return new Expanded(
      flex: flex,
      child: new Center(
        child: new GSYIConText(
          icon,
          text,
          MarkTextStyle.smallSubText,
          Color(MarkColors.subTextColor),
          15.0,
          padding: 5.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new GSYCardItem(
          child: new FlatButton(
              onPressed: onPressed,
              child: new Padding(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///头像
                        new GSYUserIconWidget(
                            padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 0.0),
                            width: 40.0,
                            height: 40.0,
                            image: reposViewModel.ownerPic,
                            onPressed: () {

                            }),
                        new Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ///仓库名
                              new Text(reposViewModel.repositoryName, style: MarkTextStyle.normalTextBold),

                              ///用户名
                              new GSYIConText(
                                Icons.accessibility,
                                reposViewModel.ownerName,
                                MarkTextStyle.smallSubLightText,
                                Color(MarkColors.subLightTextColor),
                                10.0,
                                padding: 3.0,
                              ),
                            ],
                          ),
                        ),

                        ///仓库语言
                        new Text(reposViewModel.repositoryType, style: MarkTextStyle.smallSubText),
                      ],
                    ),
                    new Container(

                        ///仓库描述
                        child: new Text(
                          reposViewModel.repositoryDes,
                          style: MarkTextStyle.smallSubText,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    ///仓库状态数值
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.access_time, reposViewModel.repositoryStar),
                        _getBottomItem(Icons.access_time, reposViewModel.repositoryFork),
                        _getBottomItem(Icons.access_time, reposViewModel.repositoryWatch, flex: 4),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}

class ReposViewModel {
  String ownerName;
  String ownerPic;
  String repositoryName;
  String repositoryStar;
  String repositoryFork;
  String repositoryWatch;
  String hideWatchIcon;
  String repositoryType = "";
  String repositoryDes;

  ReposViewModel();

  ReposViewModel.fromMap(ReposModel data) {
    ownerName = data.owner.login;
    ownerPic = data.owner.avatar_url;
    repositoryName = data.name;
    repositoryStar = data.stargazers_count.toString();
    repositoryFork = data.forks_count.toString();
    repositoryWatch = data.open_issues.toString();
    repositoryType = data.language ?? '---';
    repositoryDes = data.description ?? '---';
  }

  ReposViewModel.fromTrendMap(model) {
    ownerName = model.name;
    if(model.contributors.length > 0) {
      ownerPic = model.contributors[0];
    } else {
      ownerPic = "";
    }
    repositoryName = model.reposName;
    repositoryStar = model.starCount;
    repositoryFork = model.forkCount;
    repositoryWatch = model.meta;
    repositoryType = model.language;
    repositoryDes = model.description;
  }
}
