import 'package:flutter/material.dart';

/*
Sometimes it makes the most sense for the widget to manage its state internally.
For example, ListView automatically scrolls when its content exceeds the render box.
Most developers using ListView don’t want to manage ListView’s scrolling behavior,
so ListView itself manages its scroll offset.
*/

class TapBoxAWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TapBoxDemo'),
      ),
      body: new Center(
        child: new TapBoxA(),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);
  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;
  
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color:  Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}