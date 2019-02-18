import 'package:flutter/material.dart';
import 'package:github_flutter/components/event_item.dart';
import 'package:github_flutter/resources/color.dart';
import 'package:github_flutter/views/test/test.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  List dataList = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        color:Color(MarkColos.ThemeColor),
        onRefresh: refresh,
        child: ListView.builder(
//          itemCount: dataList.length,
          itemCount: 10,
          itemBuilder: (context, index) {
            return EventItem("test",onPressed:(){
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new InfiniteListView();
              }));
            });
          },
        ),
      ),
    );
  }

  Future<Null> refresh() async {
    dataList.clear();
    getNetData(0);
  }

  void getNetData(int pageIndex) async {}
}
