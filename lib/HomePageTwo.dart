import 'package:flutter/material.dart';

import 'package:first_flutter_application/Animations.dart';
import 'package:first_flutter_application/AnimationsTwo.dart';
import 'package:first_flutter_application/AnimationList.dart';

import 'package:first_flutter_application/model/mainData.dart';
import 'package:first_flutter_application/StaggeredAnimations.dart';

class HomePageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageTwoState();
  }
}

class HomePageTwoState extends State<HomePageTwo> {
  final List<String> _titles = MainData.instance.dataSource2; // 数据源
  void _pushPage(int i) {
    Widget page;
    switch (i) {
      case 0:
        page = new AnimationWidget();
        break;
      case 1:
        page = new AnimationsTwo();
        break;
      case 2:
        page = new AnimatedListSample();
        break;
      case 3:
        page = new StaggerDemo();
        break;
      default:
        break;
    }
    if (page != null) {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return page;
          }
        ),
      );
    }
  }
  Widget _buildList() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _titles.length,
      itemBuilder: (context, i){
        return getRow(i);
      },
    );
  }
  Widget getRow(int i) {
    return new ListTile(
      title: new Text(_titles[i]),
      onTap: (){
        print('tap $i');
        _pushPage(i);
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('动画学习Demo'),
        centerTitle: true,
      ),
      body: new Center(
        child: _buildList(),
      ),
    );
  }
}