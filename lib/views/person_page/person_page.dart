import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/resources/style.dart';
import 'package:github_flutter/utils/time_utils.dart';
import 'package:github_flutter/widget/GSYUserIconWidget.dart';
import 'package:github_flutter/main.dart';

class PersonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonState();
  }
}

class PersonState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(height: 260),
                child: CachedNetworkImage(
                  //预览图
                  placeholder: (context, url) => Image.asset(
                        MarkIcons.DEFAULT_USER_ICON,
                        fit: BoxFit.cover,
                      ),
                  fit: BoxFit.cover,
                  imageUrl: userDao.getUserInfo.avatar_url,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  constraints: BoxConstraints.expand(height: 260),
                  color: Color(MarkColors.ThemeColor).withAlpha((255*0.5).round()),
                ),
              ),
              Positioned(
                top: 130,
                left: 16,
                child: GSYUserIconWidget(
                  image: userDao.getUserInfo.avatar_url,
                  width: 80,
                  height: 80,
                  padding: EdgeInsets.all(0),
                ),
              ),
              Positioned(
                top: 146,
                left: 108,
                width: 200,
                child: Text(
                  userDao.getUserInfo.login,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MarkTextStyle.normalTextWhite,
                ),
              ),
              Positioned(
                top: 186,
                left: 112,
                width: 200,
                child: Text(
                  "Joined at ${TimeUtils.getFriendlyTimeSpanByNowString(userDao.getUserInfo.created_at)}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MarkTextStyle.smallTextWhite,
                ),
              ),
            ],
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8, bottom: 20),
                    child: Text(
                      userDao.getUserInfo.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: MarkTextStyle.bigTextSize,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    userDao.getUserInfo.bio,
                    style: MarkTextStyle.smallSubText,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.mail,
                          size: 16,
                          color: Color(MarkColors.subGreenTextColor),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            userDao.getUserInfo.email,
                            style: TextStyle(
                              fontSize: MarkTextStyle.smallTextSize,
                              color: Color(MarkColors.subGreenTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              userDao.getUserInfo.followers.toString(),
                              style: MarkTextStyle.smallSubText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                "followers",
                                style: MarkTextStyle.smallSubText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              userDao.getUserInfo.following.toString(),
                              style: MarkTextStyle.smallSubText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                "following",
                                style: MarkTextStyle.smallSubText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              userDao.getUserInfo.public_repos.toString(),
                              style: MarkTextStyle.smallSubText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                "repos",
                                style: MarkTextStyle.smallSubText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              userDao.getUserInfo.public_gists.toString(),
                              style: MarkTextStyle.smallSubText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                "gists",
                                style: MarkTextStyle.smallSubText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
