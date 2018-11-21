import 'package:flutter/material.dart';

/*
In this section, you’ll create a custom stateful widget. You’ll replace two stateless widgets—the solid red star and the numeric count next to it—with a single custom stateful widget that manages a row with two children widgets: an IconButton and Text.

Implementing a custom stateful widget requires creating two classes:

A subclass of StatefulWidget that defines the widget.
A subclass of State that contains the state for that widget and defines the widget’s build() method.
 */

class UITestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, '电话'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps.
        Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes.
        A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest,
        leads you to the lake, which warms to 20 degrees Celsius in the summer.
        Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Swizerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          new FavoriteWidget(),
        ],
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('UI Test Demo'),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            'images/lake.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    ); // 返回标题行
  }
}

// Widget组件
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() {
      return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;
  
  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: _isFavorite ? new Icon(Icons.star, color: Colors.redAccent,) : new Icon(Icons.star_border),
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}