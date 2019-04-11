import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String url = "https://juejin.im/post/5bc5a56a5188255c352d88fe";

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WebViewPageState();
  }
  
}

class _WebViewPageState extends State<WebViewPage> {
  String title = "Widget webview";
  bool isloading = false;
  FlutterWebviewPlugin flutterWebViewPlugin;
  // WebView 加载状态变化的监听器
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<double> _onScrollYChanged;
  
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text(title),
        centerTitle:  true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: isloading
              ? CupertinoActivityIndicator()
              : IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  flutterWebViewPlugin.reload();
                },
              ),
          )
        ],
      ),
    );
  }
  
  @override
  void initState() {
    flutterWebViewPlugin = new FlutterWebviewPlugin();
    _onScrollYChanged = flutterWebViewPlugin.onScrollYChanged.listen((double offsetY) {
      print("最新偏移：$offsetY");
    });
    _onStateChanged = flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        switch (state.type) {
          case WebViewState.startLoad:
            setState(() {
              isloading = true;
            });
            break;
          case WebViewState.shouldStart:
            setState(() {
              isloading = true;
            });
            break;
          case WebViewState.finishLoad:
            setState(() {
              isloading = false;
            });
            break;
          default:
            // 默认的case
            break;
        }
      }
    });
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
    _onStateChanged.cancel();
    _onScrollYChanged.cancel();
    flutterWebViewPlugin.dispose();
  }
}
