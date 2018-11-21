// refactoring with AnimatedBuilder
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationsTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimationsTwoState();
  }
}

class _AnimationsTwoState extends State<AnimationsTwo> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);
    controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("动画的第二种实现方式"),
      ),
      body: GrowTransition(child: LogoWidget(), animation: animation),
    );
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// starting from the bottom of the widget tree, the code for rendering the logo is straightforward.
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.teal,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}