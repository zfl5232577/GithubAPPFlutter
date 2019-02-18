import 'package:flutter/material.dart';
import 'package:github_flutter/resources/color.dart';

class EventItem extends StatelessWidget {
  final String eventViewModel;

  final VoidCallback onPressed;

  EventItem(this.eventViewModel, {this.onPressed}) : super();

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
            Image.asset(
              'assets/images/ic_launcher.png',
              width: 56,
              height: 56,
            ),
            Expanded(
              child: Container(
                height: 56.0,
                padding: EdgeInsets.only(left: 16, top: 5, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Text("sadsadsadsadasdasd")),
                    Text(
                      "今天",
                      style:
                          TextStyle(fontSize: 12, color: Color(MarkColos.HintTextColor)),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.dashboard)
          ],
        ),
      ),
    );
  }
}
