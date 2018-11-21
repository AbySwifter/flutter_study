import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class AnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationWidgetState();
  }
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {
  
  Animation<double> animation;
  AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    // 添加状态监听，可以是实现动画循环效果
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("动画"),
      ),
      body: new AnimatedLogo(animation: animation),
    );
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}
