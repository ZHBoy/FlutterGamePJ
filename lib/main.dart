import 'package:flutter/material.dart';
import 'package:FlutterGamePj/base/Routers.dart';
import 'package:screen_ratio_adapter/screen_ratio_adapter.dart';

///设计稿尺寸，单位应是pt或dp
var uiSize = BlueprintsRectangle(414, 878);
// void main() {
//   runApp(MyApp());
// }
void main() {
  return runFxApp(MyApp(),
      uiBlueprints: uiSize, onEnsureInitialized: (info) {}, enableLog: true);
}

//自定组件就是类
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'HomePage',
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(primarySwatch: Colors.red),
      builder: FxTransitionBuilder(builder: null),
    );
  }
}
