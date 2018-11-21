import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return new Text('Count $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('增加'),
    );
  }
}

// 解耦计数显示和计数更改
class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      ++ _counter;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new CounterIncrementor(onPressed: _increment),
        new CounterDisplay(count: _counter)
      ],
    );
  }
}