import 'package:flutter/material.dart';

class RepositoriesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RepositoriesState();
  }

}

class RepositoriesState extends State<RepositoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("RepositoriesState"),
        centerTitle:true,
        elevation: 0,
      ),
      body: ListView(),
    );
  }
}