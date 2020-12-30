import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/SimpleDialog.dart';
import 'dart:ui';

///拼眼力页面

class GameEyeLevelPage extends StatefulWidget {
  @override
  _GameEyeLevelPageState createState() => _GameEyeLevelPageState();
}

class _GameEyeLevelPageState extends State<GameEyeLevelPage> {
  @override
  void initState() {
    super.initState();
    // initState不允许加上async，通过 Future.delayed获取数据，setState装载到页面上
    Future.delayed(
        Duration.zero,
        () => setState(() {
              alertDialog(context, "找到不同颜色的方格");
            }));
  }

  @override
  Widget build(BuildContext context) {
    final width = window.physicalSize.width; //获取屏幕宽
    final height = window.physicalSize.height; //获取屏幕高
    return Center(
      child: CustomPaint(
        size: Size(width, height), //指定画布大小
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  var rowWidth = 30; //网格宽是 屏幕宽的1/30
  var columnHeight = 80; //网格高是 屏幕高的1/80

  var randomW = Random().nextInt(30); //随机网格 横向位置
  var randomH = Random().nextInt(80); //随机网格 纵向位置
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / rowWidth;
    double eHeight = size.height / columnHeight;

    //网格背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0xffADD8E6); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //指定网格背景
    var paint2 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0xff87CEEB); //背景为纸黄色
    canvas.drawRect(
        Rect.fromLTWH(eWidth * randomW, eHeight * randomH, eWidth, eHeight),
        paint2);

    //网格布局
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Color(0xffe1e9f0)
      ..strokeWidth = 1.1;

    //画横线
    for (int i = 0; i <= columnHeight; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    //画竖线
    for (int i = 0; i <= rowWidth; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
