import 'dart:convert';
import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SampleNetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SampleNetPage(); // State
  }
}

class _SampleNetPage extends State<SampleNetPage> {
  List widgets = [];
  
  @override
  void initState() {
    super.initState();
//    loadDate(); // 加载数据
    loadDateBackground(); // 在后台线程加载数据
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("异步加载"),
      ),
      body: new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        }
      ),
    );
  }
  
  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[i]["title"]}"),
    );
  }
  
  // 这是一种 I/O 操作的调用方式
  void loadDate() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
  
  // 把网络请求弄到后台处理
  void loadDateBackground() async {
    ReceivePort receivePort = new ReceivePort();
    // 在这里dataLoader是独立执行线程中运行的。在隔离区中，可以执行更多的CPU密集型处理（例如解析 大型JSON），或者执行计算密集型数学运算或信号处理
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    
    SendPort sendPort = await receivePort.first;
    
    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");
    
    setState(() {
      widgets = msg;
    });
  }
  
  // The entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    ReceivePort port = new ReceivePort();
    
    sendPort.send(port.sendPort);
    
    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      
      String dataURL = data;
      http.Response response = await http.get(dataURL);
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}
