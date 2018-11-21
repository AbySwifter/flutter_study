import 'package:first_flutter_application/MaterialComponents/components.dart';
import 'package:flutter/material.dart';

class DisplayCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Display Count'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('计数器'),
            new Counter(),
          ],
        ),
      ),
    );
  }
}