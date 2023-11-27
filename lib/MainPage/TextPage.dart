import 'package:flutter/material.dart';
import 'Home_component.dart';
import 'ListView_Header.dart';
import 'simulation_test.dart';


class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Theory Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TextPage(),
    );
  }
}

class TextPage extends StatelessWidget {
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
              onPressed: () {},
              child: Text('立即购买'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
            Header(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 370,
                  height: 230,
                  child: testModule(
                      title: "五级乐理模拟试卷 （Mock Exam 01）",
                      introduce:
                          "不规则拍子，乐器法综合知识，休止符，减音程，半截音符，单复拍子转换，单音程，和弦名称，填乐谱不规则拍子，乐器法综合知识，休止符，减音程，半截音符，单复拍子转换，单音程，和弦名称，填乐谱"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 370,
                  height: 230,
                  child: testModule(
                      title: "五级乐理模拟试卷 （Mock Exam 01）",
                      introduce:
                          "不规则拍子，乐器法综合知识，休止符，减音程，半截音符，单复拍子转换，单音程，和弦名称，填乐谱"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 370,
                  height: 230,
                  child: testModule(
                      title: "五级乐理模拟试卷 （Mock Exam 01）",
                      introduce:
                          "不规则拍子，乐器法综合知识，休止符，减音程，半截音符，单复拍子转换，单音程，和弦名称，填乐谱"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 370,
                  height: 230,
                  child: testModule(
                      title: "五级乐理模拟试卷 （Mock Exam 01）",
                      introduce:
                          "不规则拍子，乐器法综合知识，休止符，减音程，半截音符，单复拍子转换，单音程，和弦名称，填乐谱"),
                ),
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