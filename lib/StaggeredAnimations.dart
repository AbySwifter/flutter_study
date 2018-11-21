import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({ Key key, this.controller }) :
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.100,
          curve: Curves.ease,
        ),
      ),
    ),
    width = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.125, 0.250,
          curve: Curves.ease,
        )
      ),
    ),
    height = Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.250, 0.375,
          curve: Curves.ease,
        ),
      ),
    ),
    padding = EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 16.0),
      end: const EdgeInsets.only(bottom: 75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.250, 0.375,
          curve: Curves.ease,
        ),
      ),
    ),
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375, 0.500,
          curve: Curves.ease,
        ),
      ),
    ),
    color = ColorTween(
      begin: Colors.indigo[100],
      end: Colors.orange[400],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.500, 0.750,
          curve: Curves.ease,
        ),
      ),
    ),
    super(key: key);
  
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;
  
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: Colors.indigo[300],
              width: 3.0,
            ),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StaggerDemoState();
  }
  
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    timeDilation = 1.0;
    super.dispose();
  }
  
  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed.
    }
  }
  
  @override
  Widget build(BuildContext context) {
     timeDilation = 10.0; // 1.0 is normal animation speed
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: new Center(
          child: new Center(
            child: new Container(
              width: 300.0,
              height: 300.0,
              decoration: new BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: new Border.all(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              child: new StaggerAnimation(
                controller: _controller.view,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
