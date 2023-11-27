import 'package:flutter/material.dart';
import 'TextPage.dart';
import 'package:test1/MainPage/test.dart';
// 测试封住的模块
class testModule extends StatelessWidget {
  final String title;
  final String introduce;
  testModule({required this.title, required this.introduce});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      height: 200,
      // color: Colors.grey,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular((8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            // width: 400,
            margin: EdgeInsets.all(10),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: 10),
            width: 330,
            height: 50,
            child: Text(
              introduce,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 240,
                child: Text("58题/120分钟/75分钟"),
              ),
              // 测试里的start按钮
              Container(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context)=>new test())
                      );
                  },
                  child: Text("START"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: StadiumBorder()),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
