import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 键值对存储

class DataBaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DatabaseState();
  }
}

class _DatabaseState extends State<DataBaseWidget> {
  GlobalKey _currentPage = new GlobalKey();

  final TextEditingController userNameController =
      new TextEditingController(); // 用户名的Controller
  final TextEditingController pwdController =
      new TextEditingController(); // 密码的Controller

  Widget _getBody(BuildContext context) {
    return  new Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
      width: double.infinity,
      // 在高度上撑满
      height: double.infinity,
      // 在宽度上撑满
      alignment: Alignment.topCenter,
      decoration: new BoxDecoration(
        color: const Color(0xfff9f9f9), // 背景色
      ),
      child: new Column(
        children: <Widget>[
          Center(
            child: new TextField(
              controller: userNameController,
              decoration: new InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                border: new OutlineInputBorder(
                  borderSide:
                  BorderSide(style: BorderStyle.solid)), // 边框
              ),
              textAlign: TextAlign.start,
              autofocus: true,
              // 自动对焦
              keyboardType: TextInputType.emailAddress, // 键盘类型
            ),
          ),
          new TextField(
            controller: pwdController,
            decoration: new InputDecoration(
              hintText: "请输入密码",
            ),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            obscureText: true,
            autocorrect: false,
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 40),
            child: new Row(
              children: <Widget>[
                new Expanded(child:  new FlatButton(
                  child: new Text(
                    "点击保存用户信息",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: saveUser,
                  padding: new EdgeInsets.symmetric(horizontal: 10),
                  color: Theme.of(context).primaryColor,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _currentPage,
      appBar: new AppBar(
        title: new Text('数据库'),
        centerTitle: true,
      ),
      body: _getBody(context),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    pwdController.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userNameController.text = prefs.getString("user");
    pwdController.text = prefs.getString("pwd");
  }

  void saveUser() async {
    String username = userNameController.text;
    String pwd = pwdController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", username);
    await prefs.setString("pwd", pwd);
  }
}
