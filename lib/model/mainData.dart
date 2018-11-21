import 'dart:core';

// dart中的单例模式

class MainData extends Object {
  // 工厂模式? 搞清楚factory的关键字的作用
  factory MainData() => _getInstance();
  static MainData get instance => _getInstance();
  static MainData _instance;
  MainData._internal() {
    // 私有初始化方法
  }
  static MainData _getInstance() {
    if (_instance == null) {
      _instance = new MainData._internal();
    }
    return _instance;
  }
  final List<String> dataSource = [
    '第一个Demo',
    '布局学习',
    'TabBox I (管理状态)',
    'TabBoX II (父视图管理状态)',
    'TabBox III (混合管理状态)',
    '基础Widget (组件的学习)',
    'MaterialComponents',
    '购物列表Demo',
    'CountDisply',
    '平台特定接口',
    'JSON 的解析与读取',
    '网络与异步',
    '显示长线任务的进度',
    '输入框',
    '数据库',
  ];
  
  final List<String> dataSource2 = [
    '动画（Tween animation）',
    '动画II (Tween animation)',
    '动画III（Animation list）',
    '动画IV（Stagger animation）',
  ];
  final List<String> dataSource3 = [
    '图片占位符',
    '使用不同类型的子项创建列表',
    '下拉刷新，上拉加载',
    '贝塞尔曲线',
    'WebView',
    'Iconfont的使用',
  ];
}