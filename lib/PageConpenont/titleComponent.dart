import 'package:flutter/material.dart';
import 'CountdownPage.dart';
import 'package:test1/MainPage/test2.dart';

// title区域的内容
class titleComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(7),
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("<"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(50, 50),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(7),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MyMusicTheoryApp()));
            },
            child: Text(">"),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(50, 50),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: 100,
          height: 50,
          child: CountdownPage(),
        )
      ],
    );
  }
}
