import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/SimpleDialog.dart';
import 'package:audioplayers/audioplayers.dart';

/*
 * 拼手速页面
 */
class GameHandSpeedPage extends StatefulWidget {
  @override
  _GameHandSpeedPageState createState() => _GameHandSpeedPageState();
}

class _GameHandSpeedPageState extends State<GameHandSpeedPage> {
  String blueNum = "0"; //蓝色方数值
  String redNum = "0"; //红色方数值

  // 音频播放器
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  void initState() {
    super.initState();

    // initState不允许加上async，通过 Future.delayed获取数据，setState装载到页面上
    Future.delayed(
        Duration.zero,
        () => setState(() {
              alertDialog(context, "先点到30赢");
            }));
  }

  @override
  void deactivate() async {
    print('结束');
    int result = await audioPlayer.release();
    if (result == 1) {
      print('release success');
    } else {
      print('release failed');
    }
    super.deactivate();
  }

  play() async {
    int result = await audioPlayer.play(
        "http://img-cdn2.515ppt.com/sound/00/29/03/50/290350_4314898cd9c1d23577d9e1ce017d9042.mp3");
    if (result == 1) {
      // success
      print("success");
    }
  }

  stop() async {
    await audioPlayer.stop();
  }

  // 动态设置布局
  //isBlue 是否为蓝方，蓝方正面 红方背面
  //
  Widget _getLayoutWdt(bool isBlue, int maxNum) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: isBlue ? Colors.blue : Colors.red, //北京颜色
          ),
          //数字
          Container(
              padding: EdgeInsets.all(20),
              child: Transform.rotate(
                angle: isBlue ? 0 : pi / 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    isBlue ? this.blueNum : this.redNum,
                    style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w400, //字体粗细
                        decoration: TextDecoration.none),
                  ),
                ),
              )),
          Container(
              child: Transform.rotate(
            angle: isBlue ? 0 : pi / 1,
            child: Align(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text(
                  "戳",
                  style: TextStyle(fontSize: 60),
                ),
                onPressed: () {
                  setState(() {
                    if (isBlue) {
                      var blue = int.parse(this.blueNum);
                      if (blue == maxNum) {
                        this.blueNum = "你赢了";
                        this.redNum = "你输了";
                        stop(); //停止播放音频
                      } else {
                        this.blueNum = (blue + 1).toString();
                      }
                    } else {
                      var red = int.parse(this.redNum);
                      if (red == maxNum) {
                        this.redNum = "你赢了";
                        this.blueNum = "你输了";
                        stop(); //停止播放音频
                      } else {
                        this.redNum = (red + 1).toString();
                      }
                    }
                  });
                  play(); //开始播放
                },
                color: isBlue ? Colors.red : Colors.blue, //按钮的背景颜色
                textColor: Colors.white, //字体颜色
                elevation: 10.0, //阴影
                splashColor:
                    isBlue ? Colors.red : Colors.blue, //点击后的水波纹的颜色一般不改这里知道就可以了
                shape: CircleBorder(
                    //设置 圆形
                    side: BorderSide(
                        //默认圆形的变宽为黑色
                        color: isBlue ? Colors.red : Colors.blue //所以要在这里设置下边框颜色
                        )),
              ),
            ),
          )),

          //提示
          Container(
              padding: EdgeInsets.all(60),
              child: Transform.rotate(
                angle: isBlue ? 0 : pi / 1,
                child: Align(
                  child: Text(
                    '温馨提示：屏幕很脆，您下手轻点',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ))
        ],
      ),
      flex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _getLayoutWdt(false, 20),
          _getLayoutWdt(true, 20),
        ],
      ),
    );
  }
}
