import 'package:flutter/material.dart';
import 'package:first_flutter_application/UITestDemo.dart';
import 'package:first_flutter_application/StartDemo.dart';
import 'package:first_flutter_application/TabBoxA.dart';
import 'package:first_flutter_application/TapBoxB.dart';
import 'package:first_flutter_application/TapBoxC.dart';
import 'package:first_flutter_application/BasicWidgets.dart';
import 'package:first_flutter_application/MaterialComponents/MaterialComponents.dart';
import 'package:first_flutter_application/ShoppingList.dart';
//import 'package:first_flutter_application/DisplayCount.dart';
import './DisplayCount.dart';
import 'package:first_flutter_application/JsonCode.dart';
import 'package:first_flutter_application/PlatformCode.dart';
import 'package:first_flutter_application/Network.dart';
import 'package:first_flutter_application/SampleProgress.dart';
import 'package:first_flutter_application/TextInput.dart';
import 'package:first_flutter_application/DataBase.dart';
import 'package:first_flutter_application/Animations.dart';
import 'package:first_flutter_application/AnimationsTwo.dart';

import 'package:first_flutter_application/model/mainData.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<String> _titles = MainData.instance.dataSource; // 数据源
  void _pushPage(int i) {
    Widget page;
    switch (i) {
      case 0:
        page = new RandomWords();
        break;
      case 1:
        page = new UITestWidget();
        break;
      case 2:
        page = new TapBoxAWidget();
        break;
      case 3:
        page = new ParentWidgetPage();
        break;
      case 4:
        page = new TapBoxCWidget();
        break;
      case 5:
        page = new MyScaffold(); // 自定义页面
        break;
      case 6:
        page = new TutorialHome();
        break;
      case 7:
        page = new ShoppingList(
          products: <Product>[
            new Product(name: 'Eggs'),
            new Product(name: 'Flour'),
            new Product(name: 'Chocolate chips'),
          ],
        );
        break;
      case 8:
        page = new DisplayCounter();
        break;
      case 9:
        page = new BatterLevel();
        break;
      case 10:
        page = new JsonCodeWidget();
        break;
      case 11:
        page = new SampleNetPage();
        break;
      case 12:
        page = new SampleProgressPage();
        break;
      case 13:
        page = new MyForm();
        break;
      case 14:
        page = new DataBaseWidget();
        break;
      case 15:
        page = new AnimationWidget();
        break;
      case 16:
        page = new AnimationsTwo();
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
        title: new Text('Flutter 学习Demo'),
        centerTitle: true,
      ),
      body: new Center(
        child: _buildList(),
      ),
    );
  }
}