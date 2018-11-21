import 'package:flutter/material.dart';

class TapBoxCWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('混合控制状态'),
      ),
      body: new Center(
        child: new ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new TapBoxC(
      active: _active,
      onChanged: _handleTapBoxChanged
    );
  }
}
// ------ TapBox C ---------
class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active: false, @required this.onChanged})
    : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  _TapBoxCState createState() {
    return new _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;
  
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }
  
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }
  void _handleCancel() {
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap() {
    print('widget\'s active is ${widget.active}');
    widget.onChanged(!widget.active);
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
          ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          ) : null,
        ),
      ),
    );
  }
}