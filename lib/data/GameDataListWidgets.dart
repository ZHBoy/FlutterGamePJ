import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List gameListData = [
  {
    "title": "拼手速",
    "imageUrl": "images/game01.png",
    "beginColor": Color.fromARGB(100, 200, 255, 255),
    "endColor": Color.fromARGB(100, 100, 255, 255),
    "jumpPage": "GameHandSpeedPage",
    "isBig": true
  },
  {
    "title": "拼眼力",
    "imageUrl": "images/game01.png",
    "beginColor": Color.fromARGB(100, 255, 200, 255),
    "endColor": Color.fromARGB(100, 255, 1, 255),
    "jumpPage": "GameEyeLevelPage",
    "isBig": true
  },
  {
    "title": "拼运气",
    "imageUrl": "images/game01.png",
    "beginColor": Color.fromARGB(100, 1, 100, 255),
    "endColor": Color.fromARGB(100, 1, 100, 100),
    "jumpPage": "GameHandSpeedPage",
    "isBig": true
  },
  {
    "title": "拼艺术\n细   菌",
    "imageUrl": "images/game01.png",
    "beginColor": Colors.red,
    "endColor": Color.fromARGB(255, 255, 100, 100),
    "jumpPage": "GameHandSpeedPage",
    "isBig": false
  },
  {
    "title": "你有没\n有文化",
    "imageUrl": "images/game01.png",
    "beginColor": Colors.red,
    "endColor": Colors.blueAccent,
    "jumpPage": "GameHandSpeedPage",
    "isBig": false
  },
  {
    "title": "经   典\n大转盘",
    "imageUrl": "images/game01.png",
    "beginColor": Color.fromARGB(255, 255, 255, 100),
    "endColor": Color.fromARGB(255, 255, 125, 100),
    "jumpPage": "GameLotteryPage",
    "isBig": false
  },
  {
    "title": "拼定力",
    "imageUrl": "images/game01.png",
    "beginColor": Color.fromARGB(255, 1, 110, 255),
    "endColor": Color.fromARGB(255, 1, 200, 100),
    "jumpPage": "GameHandSpeedPage",
    "isBig": false
  }
];
List<StaggeredTile> getStaggeredTiles() {
  var d = gameListData.map((value) {
    return StaggeredTile.count(2, value["isBig"] ? 2.5 : 1.25);
  });
  return d.toList();
}

List<Widget> getTiles(BuildContext context) {
  var d = gameListData.map((value) {
    return GameBtContainer(
        value["title"],
        value["imageUrl"],
        value["beginColor"],
        value["endColor"],
        value["isBig"],
        value["jumpPage"]);
  });
  return d.toList();
}

//自定义图片组件
// ignore: must_be_immutable
class GameBtContainer extends StatelessWidget {
  String title = ""; //名称
  String imageUrl; //图片地址
  Color beginColor = Colors.blue; //渐变色开始颜色
  Color endColor = Colors.yellow; //渐变色结束颜色
  bool isBig = true; //是否为大的按钮
  String jumpPage = ""; //是否为大的按钮

  GameBtContainer(this.title, this.imageUrl, this.beginColor, this.endColor,
      this.isBig, this.jumpPage);

  Widget _getButton(context) {
    if (this.isBig) {
      return
          //设置点击
          InkWell(
              onTap: () {
                print(jumpPage);
                Navigator.pushNamed(context, jumpPage);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    this.imageUrl,
                    fit: BoxFit.cover,
                    width: 120.0,
                    height: 120.0,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 1.1, //字间距
                      fontWeight: FontWeight.w800, //字体粗细
                    ),
                  )
                ],
              ));
    }
    return //设置点击
        InkWell(
            onTap: () {
              print(jumpPage);
              Navigator.pushNamed(context, jumpPage);
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    this.imageUrl,
                    fit: BoxFit.cover,
                    width: 60.0,
                    height: 60.0,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 1.1, //字间距
                      fontWeight: FontWeight.w800, //字体粗细
                    ),
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [this.beginColor, this.endColor]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: _getButton(context),
    );
  }
}
