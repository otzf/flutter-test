import 'package:flutter/material.dart';
import 'Home_component.dart';
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Theory Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: loginPage(),
    );
  }
}

class loginPage extends StatelessWidget {
  onShopping() {}
  onTrialPressed() {}
  Widget listLine = Container(
    height: 50,
    child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text('首页'),
            ),
            // 下边框
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 3, color: Colors.red))),
          );
        }),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'images/logoT.png',
            width: 100,
            height: 100,
          ),
          backgroundColor: Colors.grey,
          actions: [
            ElevatedButton(
              onPressed: onShopping,
              child: Text('立即购买'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: onTrialPressed,
              child: Text('trial'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            listLine,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                HomeComponet(typeTitle: "模拟考试", introduce: "仿真考试场景,1:1匹配各种题型。多达30套完整试卷.", picture: "buttonLogo.png", buttonContent: "GO"),
                HomeComponet(typeTitle: "错题本", introduce: "记录所有错题，标记重要程度，记录笔记。", picture: "correction.png", buttonContent: "GO"),
                HomeComponet(typeTitle: "模拟考试", introduce: "仿真考试场景,1:1匹配各种题型。多达30套完整试卷.", picture: "buttonLogo.png", buttonContent: "GO"),
                HomeComponet(typeTitle: "模拟考试", introduce: "仿真考试场景,1:1匹配各种题型。多达30套完整试卷.", picture: "buttonLogo.png", buttonContent: "GO"),
                
              ],
            )
          ],
        ));
  }
}
//  "模拟考试"
//  "仿真考试场景,1:1匹配各种题型。多达30套完整试卷."
// "images/buttonLogo.png"
// GO