import 'dart:convert';
import 'package:flutter/material.dart';
import './MaterialComponents/user.dart'; // 可以通过路径导入

class JsonCodeWidget extends StatelessWidget {
  final String jsonString = """
  {
  "name": "John Smith",
  "email": "john@example.com"
  }
  """;
  
  void decodeJson() {
    // 利用自制的Json处理方案进行Json处理
    Map<String, dynamic> userMap = json.decode(jsonString); // 解析Json的接口在Dart 2 上面更新了
//    print('json 数据为： $userMap');
//    var user = new User.fromJson(userMap);
//    print(user.name);
    User user = new User.fromJson(userMap);
    print(user.name); // 解析结果
  }
  
  void encodeJson() {
    User user = new User("han mei mei", "hanmiemie@email.com");
    String userString = json.encode(user);
    print('格式化json后的结果：$userString');
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Json解码"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text('解析JSON'),
              onPressed: decodeJson,
            ),
            new RaisedButton(
              child: new Text('转化为JSON'),
              onPressed: encodeJson
            ),
          ],
        ),
      ),
    );
  }
}