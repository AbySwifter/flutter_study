import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceholderImage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final String imageUrl = 'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true';
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fade in Images'),
      ),
      body: new Stack(
        children: <Widget>[
          new Center(child:  new CircularProgressIndicator()),
          new Center(
            child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageUrl,
            ),
          )
        ],
      ),
    );
  }
}