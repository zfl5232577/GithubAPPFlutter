import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const ListViewItem({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          constraints:
              BoxConstraints(minWidth: double.infinity, minHeight: 72.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(
                'assets/images/ic_launcher.png',
                width: 56,
                height: 56,
              ),
              Text(" hello world sadsadsadsadsad"),
              Icon(Icons.dashboard)
            ],
          ),
        )
//      child: ListTile(
//        onTap: () {
//          // _launchURL(itemUrl, context);
////          Application.router.navigateTo(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri.encodeComponent(itemUrl)}');
//          Navigator.push(context, new MaterialPageRoute(builder: (context) {
//            return new InfiniteListView();
//          }));
//        },
//        title: Padding(
//          child: Text(
//            itemTitle,
//            style: TextStyle(color: Colors.black, fontSize: 15.0),
//          ),
//          padding: EdgeInsets.only(top: 10.0),
//        ),
//        subtitle: Row(
//          children: <Widget>[
//            Padding(
//              child: Text(data,
//                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
//              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//            )
//          ],
//        ),
//        trailing:
//            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
//      ),
        );
  }
}
