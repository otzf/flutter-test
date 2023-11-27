import 'package:flutter/material.dart';
import 'package:test1/MainPage/loginPage.dart';
// 进入到测试页的头部封装
class Header extends StatelessWidget {
  // final String title;
  // Header({required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      
              child: Row(
                children: [
                  GestureDetector(
                      child: Text("首页",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                      onTap: () {
                        // do what you need to do when "Click here" gets clicked
                        Navigator.push(
                          context, 
                          new MaterialPageRoute(
                            builder:(context)=>new HomeContent() 
                          )
                        );
                      }),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text("/模拟试卷"),
                  )
                ],
              ),
              // 下边框
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 3, color: Colors.red))),
           
    );
  }
}
