import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ParentWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('父视图控制状态'),
      ),
      body: new Center(
        child: new ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        onChanged: _handleTapboxChanged,
        active: _active,
      ),
    );
  }
}

// --------- TapBox ----------
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);
  
  final bool active;
  final ValueChanged<bool> onChanged;
  
  void _handleTap() {
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
   return new GestureDetector(
     onTap: _handleTap,
     child: new Container(
       child: new Center(
         child: new Text(
           active ? 'Active' : 'Inactive',
           style: new TextStyle(fontSize: 32.0, color: Colors.white),
         ),
       ),
       width: 200.0,
       height: 200.0,
       decoration: new BoxDecoration(
         color: active? Colors.lightGreen[700] : Colors.grey[600],
       ),
     ),
   );
  }
}