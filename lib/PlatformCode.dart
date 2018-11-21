import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatterLevel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BatterLevelState();
  }
}

class _BatterLevelState extends State<BatterLevel> {
  static const platform = const MethodChannel('samples.flutter.op/battery');
  
  String _batteryLevel = 'Unknown Battery level';
  
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result %.';
    } on PlatformException catch (e) {
      batteryLevel = "Faild to get battery level: '${e.message}'";
    }
    
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text('Get Battery level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}