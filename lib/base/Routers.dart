import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import '../pages/GameHandSpeedPage.dart';
import '../pages/GameEyeLevelPage.dart';
import '../pages/GameLotteryPage.dart';

/*
 * 路由配置类
 */
final routes = {
  //首页
  'HomePage': (context, {arguments}) => HomePage(),
  //拼手速页面
  'GameHandSpeedPage': (context, {arguments}) => GameHandSpeedPage(),
  //拼眼力页面
  'GameEyeLevelPage': (context, {arguments}) => GameEyeLevelPage(),
  //大转盘
  'GameLotteryPage': (context, {arguments}) => GameLotteryPage(),
};

//固定写法
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      print(settings.arguments.toString());
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
