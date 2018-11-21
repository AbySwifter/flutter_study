import 'package:flutter/material.dart';
import 'package:first_flutter_application/PlaceHolderImage.dart';
import 'package:first_flutter_application/model/mainData.dart';
import 'package:first_flutter_application/RefreshList.dart';
import 'package:first_flutter_application/Paint.dart';
import 'package:first_flutter_application/WebviewPage.dart';
import 'package:first_flutter_application/IconFontUse.dart';
import 'SectionList.dart';

class HomePageThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageTwoState();
  }
}

class _HomePageTwoState extends State<HomePageThree> {
  final List<String> _titles = MainData.instance.dataSource3; // 数据源
  void _pushPage(int i) {
    Widget page;
    switch (i) {
      case 0:
        page = new PlaceholderImage();
        break;
      case 1:
        page = new SectionListPage();
        break;
      case 2:
        page = new RefreshList();
        break;
      case 3:
        page = new CustomViewPage();
        break;
      case 4:
        page = new WebViewPage();
        break;
      case 5:
        page = new IconFontPage();
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
        title: new Text('第三方的学习'),
        centerTitle: true,
      ),
      body: new Center(
        child: _buildList(),
      ),
    );
  }
}