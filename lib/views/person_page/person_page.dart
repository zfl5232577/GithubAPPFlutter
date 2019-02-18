import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PersonState();
  }

}

class PersonState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("Person"),
        centerTitle:true,
        elevation: 0,
      ),
    );
  }
}