import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_flutter/views/home_page/home_page.dart';
import 'package:github_flutter/views/person_page/person_page.dart';
import 'package:github_flutter/views/repositories_page/repositories_page.dart';
import 'package:github_flutter/views/stars_page/stars_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainPage> {
  int _selectedIndex = 0;
  var pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
        body: PageView(
          children: <Widget>[
            HomePage(),
            RepositoriesPage(),
            StarsPage(),
            PersonPage()
          ],
          onPageChanged: pageChange,
          controller: pageController,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text('Repositories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Stars')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Person')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          fixedColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
//    pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void pageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
