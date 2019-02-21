import 'package:flutter/material.dart';
import 'package:github_flutter/components/event_item.dart';
import 'package:github_flutter/dao/events_dao.dart';
import 'package:github_flutter/data/event_model.dart';
import 'package:github_flutter/views/test/test.dart';
import 'package:github_flutter/widget/GSYListState.dart';
import 'package:github_flutter/widget/GSYPullLoadWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>, GSYListState<HomePage> {
  EventDao dao = new EventDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
      ),
      body: GSYPullLoadWidget(
        pullLoadWidgetControl,
        (BuildContext context, int index) =>
            pullLoadWidgetControl.dataList[index],
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey,
      ),
    );
  }

  @override
  requestRefresh() {
    return dao.getEventReceived(page: page);
  }

  @override
  requestLoadMore() {
    return dao.getEventReceived(page: page);
  }

  @override
  bool get isRefreshFirst => true;

  @override
  Widget renderEventItem(map) {
    EventModel eventModel = EventModel.fromMap(map);
    return EventItem(eventModel, onPressed: () {
//      Navigator.push(context, new MaterialPageRoute(builder: (context) {
//        return new InfiniteListView();
//      }));
    });
  }
}
