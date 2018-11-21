/*
Flutter 自带有一套强大的 Basic widgets，其中以下是经常用的：

Text： Text widget 可以在你的应用中创建一个可自定义风格的文本框。

Row, Column： 这两个 widgets 使你无论是在水平(Row) 还是在垂直位置 (Column) 都可以创建出灵活的布局，它是基于 flexbox layout model 来设计的。

Stack：你可以使用  Stack widget 来绘制需要重叠的 widget、元素，而不是安照线性方向（垂直或者水平）来布局 widget、元素。你可以在 Stack 上使用  Positioned 定位相对设置其子元素上下左右的参数。Stacks 基于网页 positioning layout model。

Container： Container 可以创建出简单的矩形元素视图。也可当做  BoxDecoration 自定义风格的容器，例如：背景，边框，阴影。 Container 可以设置 margin、padding 甚至设置任意大小尺寸。 另外  Container 可以利用矩阵在三维空间中编辑。
* */

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    Widget container = new Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.menu), 
            tooltip: 'NavigationMenu',
            onPressed: null
          ),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null
          ),
        ],
      ),
    );
    return container;
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, flutter'),
            ),
          )
        ],
      ),
    );
  }
}