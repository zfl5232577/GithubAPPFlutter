import 'package:flutter/material.dart';
import 'package:github_flutter/components/starred_item.dart';
import 'package:github_flutter/dao/starred_dao.dart';
import 'package:github_flutter/data/starred_model.dart';
import 'package:github_flutter/views/test/test.dart';
import 'package:github_flutter/widget/GSYListState.dart';
import 'package:github_flutter/widget/GSYPullLoadWidget.dart';

class StarsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StarsState();
  }

}

class StarsState extends State<StarsPage> with AutomaticKeepAliveClientMixin<StarsPage>, GSYListState<StarsPage> {
  StarredDao dao = new StarredDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("Stars"),
        centerTitle:true,
        elevation: 0,
      ),
      body:  GSYPullLoadWidget(
        pullLoadWidgetControl,
            (BuildContext context, int index) => pullLoadWidgetControl.dataList[index],
        handleRefresh,
        onLoadMore,
        refreshKey: refreshIndicatorKey,
      ),
    );
  }

  @override
  renderEventItem(map) {
    StarredModel starredModel = StarredModel.fromMap(map);
    return StarredItem(starredModel, onPressed: () {
//      Navigator.push(context, new MaterialPageRoute(builder: (context) {
//        return new InfiniteListView();
//      }));
    });
  }

  @override
  requestRefresh() {
    return dao.getStarredList(page: page);
  }

  @override
  requestLoadMore() {
    return dao.getStarredList(page: page);
  }

  @override
  bool get isRefreshFirst => true;
}