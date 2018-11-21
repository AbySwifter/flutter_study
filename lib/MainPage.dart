import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'HomePageTwo.dart';
import 'HomePageThree.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new _MainPageWidget();
  }
}

class _MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<_MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '发现', '我的'];
  /// 存放三个页面
  var _pageList;
  
  Icon getTabIcon(int currentIndex) {
    if (currentIndex == _tabIndex) {
      return tabImages[currentIndex][1];
    }
    return tabImages[currentIndex][0];
  }
  
  Text getTableTitle(int currentIndex) {
    if (currentIndex == _tabIndex) {
      return new Text(
        appBarTitles[currentIndex],
        style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)),
      );
    } else {
      return new Text(appBarTitles[currentIndex],style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  
  void initData() {
    tabImages = [
      [Icon(Icons.home, color: Colors.black54), Icon(Icons.home, color: Theme.of(context).primaryColor)],
      [Icon(Icons.menu, color: Colors.black54), Icon(Icons.menu, color: Theme.of(context).primaryColor)],
      [Icon(Icons.people, color: Colors.black54), Icon(Icons.people, color: Theme.of(context).primaryColor)],
    ];
    
    _pageList = [
      new HomePage(),
      new HomePageTwo(),
      new HomePageThree(),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: getTabIcon(0), title: getTableTitle(0)),
          new BottomNavigationBarItem(icon: getTabIcon(1), title: getTableTitle(1)),
          new BottomNavigationBarItem(icon: getTabIcon(2), title: getTableTitle(2)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}