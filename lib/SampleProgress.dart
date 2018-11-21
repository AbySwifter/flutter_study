import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SampleProgressPage extends StatefulWidget {
  SampleProgressPage({Key key}) : super(key: key);
  
  _SampleProgressState createState() {
    return new _SampleProgressState();
  }
}

class _SampleProgressState extends State<SampleProgressPage> {
  List widgets = [];
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("加载Loading"),
      ),
      body: getBody(),
    );
  }
  
  bool showLoadingDialog() {
    return widgets.length == 0;
  }
  
  Widget getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
  
  ListView getListView() => new ListView.builder(
     itemBuilder: (BuildContext context, int position) {
       return getRow(position);
     },
    itemCount: widgets.length,
  );
  
  Widget getRow(int i) {
    return new Padding(padding: new  EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));
  }
  
  Widget getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }
  
  void loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
