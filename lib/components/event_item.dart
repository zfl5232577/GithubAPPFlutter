import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/data/event_model.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/resources/style.dart';
import 'package:github_flutter/utils/time_utils.dart';

class EventItem extends StatelessWidget {
  final EventModel eventModel;

  final VoidCallback onPressed;

  EventItem(this.eventModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: FlatButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              //预览图
              placeholder: (context, url) =>
                  Image.asset(MarkIcons.DEFAULT_USER_ICON, width: 56, height: 56),
              fit: BoxFit.cover,
              imageUrl: eventModel.actor.avatar_url,
              width: 56,
              height: 56,
            ),
            Expanded(
              child: Container(
                height: 56.0,
                padding: EdgeInsets.only(left: 16, top: 5, right: 16),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned(
                        child: Text(
                      eventTitle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Positioned(
                      bottom: 0.0,
                      child: Text(
                        transCreateData(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(MarkColors.HintTextColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              eventTypeToDrawable(),
              width: 20.0,
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  String eventTypeToDrawable() {
    if (eventModel.type == "CreateEvent" ||
        eventModel.type == "ForkEvent" ||
        eventModel.type == "PushEvent") {
      return "assets/images/ic_fork_green_light.png";
    } else {
      return "assets/images/ic_star_yellow_light.png";
    }
  }

  String eventTitle() {
    String actor = eventModel.actor.display_login;
    String action;
    switch (eventModel.type) {
      case "WatchEvent":
        action = "starred";
        break;
      case "CreateEvent":
        action = "created";
        break;
      case "ForkEvent":
        action = "forked";
        break;
      case "PushEvent":
        action = "pushed";
        break;
      default:
        action = "watch";
        break;
    }
    String repo = eventModel.repo.name;
    return "$actor $action $repo";
  }

  String transCreateData() {
    return TimeUtils.getFriendlyTimeSpanByNowString(eventModel.created_at);
  }
}
