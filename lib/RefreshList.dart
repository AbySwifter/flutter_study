import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class RefreshList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RefreshListState();
  }
}

class _RefreshListState extends State<RefreshList> {
  int _itemCount;
  Widget _itemBuilder(BuildContext context, int index) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      key: new Key(index.toString()),
      child: new Text(
        "顺序数据；$index",
        style: new TextStyle(fontSize: 14.0),
      ),
    );
  }
  
  @override
  void initState() {
    _itemCount = 10;
    super.initState();
  }
  
  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount += 10;
      });
    });
  }
  
  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _itemCount = 10;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("下拉刷新的Demo"),
      ),
      body: new SafeArea(
        child: new Refresh(
          onHeaderRefresh: onHeaderRefresh,
          onFooterRefresh: onFooterRefresh,
          childBuilder: (BuildContext context, {ScrollController controller, ScrollPhysics physics}) {
            return new Container(
              child: new ListView.builder(
                physics: new AlwaysScrollableScrollPhysics().applyTo(new BouncingScrollPhysics()), // 这个是用来控制能否在不满屏的状态下滚动的属性
                controller: controller,
                itemBuilder: _itemBuilder,
                itemCount: _itemCount,
              ),
            );
          },
        ),
      ),
    );
  }
}