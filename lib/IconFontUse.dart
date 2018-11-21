import 'package:flutter/material.dart';

class IconFontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("icon font"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(IconData(0xeb61, fontFamily: 'iconfont'), size: 34.0,),
            new Icon(IconData(0xe6ad, fontFamily: 'iconfont'), size: 34.0,),
            new Icon(IconData(0xeb6a, fontFamily: 'iconfont'), size: 34.0,),
            new Icon(IconData(0xeb6d, fontFamily: 'iconfont'), size: 34.0,),
            new Icon(IconData(0xeb6e, fontFamily: 'iconfont'), size: 34.0,),
          ],
        ),
      ),
    );
  }
}