import 'dart:async';
import 'package:flutter/material.dart';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  late Timer _timer;
  int _seconds = 7200; // 初始倒计时秒数，即2小时

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(3, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // margin: EdgeInsets.only(top: 10),
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red, // 背景颜色
                // border: Border.all(
                //   color: Colors.red, // 边框颜色
                //   width: 2.0,           // 边框宽度
                // ),
                borderRadius: BorderRadius.circular(20.0), // 圆角
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  textAlign: TextAlign.center,
                  formatTime(_seconds),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
