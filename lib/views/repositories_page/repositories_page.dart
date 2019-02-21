import 'package:flutter/material.dart';
import 'package:github_flutter/components/repos_item.dart';
import 'package:github_flutter/dao/repositories_dao.dart';
import 'package:github_flutter/data/repos_model.dart';
import 'package:github_flutter/views/test/test.dart';
import 'package:github_flutter/widget/GSYListState.dart';
import 'package:github_flutter/widget/GSYPullLoadWidget.dart';

class RepositoriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RepositoriesState();
  }

}

class RepositoriesState extends State<RepositoriesPage> with AutomaticKeepAliveClientMixin<RepositoriesPage>, GSYListState<RepositoriesPage> {
  ReposDao dao = new ReposDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("RepositoriesState"),
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
  requestRefresh() {
    return dao.getReposList(page: page);
  }

  @override
  requestLoadMore() {
    return dao.getReposList(page: page);
  }

  @override
  bool get isRefreshFirst => true;

  @override
  Widget renderEventItem(map) {
    ReposModel reposModel = ReposModel.fromMap(map);
    return ReposItem(reposModel, onPressed: () {
//      Navigator.push(context, new MaterialPageRoute(builder: (context) {
//        return new InfiniteListView();
//      }));
    });
  }
}