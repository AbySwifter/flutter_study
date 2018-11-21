import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyFormState();
  }
}

class _MyFormState extends State<MyForm> {
  final myController = TextEditingController();
  String _errorText;
  
  @override
  void dispose() {
    myController.dispose(); // 销毁
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Retrieve Text Input"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new TextField(
          controller: myController,
          onSubmitted: (String text) {
            print('执行了提交的方法');
            setState(() {
              if (!isEmail(text)) {
                _errorText = '请输入正确的邮箱';
              } else {
                _errorText = null;
              }
            });
          },
          decoration: new InputDecoration(hintText: "这是一个占位符", errorText: _getErrorText()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content:  Text(myController.text),
              );
            }
          );
        },
        tooltip: 'show me the value',
        child: Icon(Icons.text_fields),
      ),
    );
  }
  
  String _getErrorText() {
    return _errorText;
  }
  
  bool isEmail(String em) {
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}