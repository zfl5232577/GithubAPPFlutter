import 'package:flutter/material.dart';

class StarsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StarsState();
  }

}

class StarsState extends State<StarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("Stars"),
        centerTitle:true,
        elevation: 0,
      ),
    );
  }
}