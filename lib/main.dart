import 'package:flutter/material.dart';
// import 'MainFolder/videoView.dart';
import 'MainFolder/custom_component.dart';
import 'MainFolder/custom_intro_section.dart';
import 'MainFolder/custom_popup_menu.dart';
import 'MainFolder/videoView.dart';
import 'MainPage/loginPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Theory Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MusicTheoryProHome(),
    );
  }
}

class MusicTheoryProHome extends StatelessWidget {
  // 锚点定位用
  // 页面长度不够时，没有内容时，锚点的定位二和三是显示一样的。锚点的步骤：声明key，再在点击事件中
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('英国皇家音乐学院 ABRSM'),
          // leading: Image.asset("images/logo.jpg", width: 200, height: 100, fit: BoxFit.contain),
          leading: Text(
            "英国皇家学院 AVRSM",
            style: TextStyle(
              fontSize: 13, // Set your desired font size here
            ),
          ),

          actions: <Widget>[
            CustomPopupMenuButton(
              items: [
                CustomPopupMenuItem(
                  value: 'Home',
                  icon: Icons.home,
                  title: 'Home',
                ),
                CustomPopupMenuItem(
                  value: 'Profile',
                  icon: Icons.person,
                  title: 'Profile',
                ),
                CustomPopupMenuItem(
                  value: 'Settings',
                  icon: Icons.settings,
                  title: 'Settings',
                ),
              ],
              onItemSelected: (value) {
                if (value == 'Home') {
                  Scrollable.ensureVisible(
                    key1.currentContext as BuildContext
                  );
                } else if (value == 'Profile') {
                  Scrollable.ensureVisible(
                    key2.currentContext as BuildContext
                  );
                 
                } else if (value == 'Settings') {
                Scrollable.ensureVisible(
                    key3.currentContext as BuildContext
                  );
                }
              },
            ),
          ],
        ),
        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  key: key1,
                 width: screenWidth * 0.9, // 90% of screen width
                  height: screenHeight * 0.4, // 15% of screen height
                  decoration: BoxDecoration(
                    color: Colors.grey, // 背景色
                    borderRadius: BorderRadius.circular(10.0), // 圆角边框
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0), // 内边距
                  child: CustomIntroSection(
                    title: '英国皇家音乐理论在线考试系统',
                    description:
                        '根据ABRSM Online Theory Exam最新大纲设计，全面覆盖官方所有题型，30套完整模拟考题。',
                    onFreeTrialPressed: () {
                      // 处理免费体验按钮点击
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder:(context)=>new HomeContent()
                           ));
                    },
                    onLoginPressed: () {
                      // 处理登录按钮点击
                    },
                  ),
                  margin: EdgeInsets.only(bottom: 30),
                ),
                Container(
                   height: screenHeight * 0.4,
                  child: VideoPlayerWidget(videoAssetPath: 'assets/sample.mp4',),
                  key: key2,
                  
                ),
               Container(
                height: screenHeight * 0.6,
                key: key3,
                child:  CustomComponent(
                  title: '何司能教授著作领街开发',
                  subtitle:
                      '英国德尔咸大学音乐博士，英国皇家音乐学院钢琴演奏高级文凭，伦敦圣三一音乐学院院士，钢琴演奏及理论作曲高级文凭。曾担任全球英皇资深考官20年，也是英皇百年来唯一华人考官',
                  buttonText: '免费体验',
                  imageName: 'person.jpg', // Replace with your image URL
                ),
               )
              ],
            ),
          );
        },
      ),);
  }
}

