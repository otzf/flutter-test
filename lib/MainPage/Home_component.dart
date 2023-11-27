import 'package:flutter/material.dart';
import 'TextPage.dart';
class HomeComponet extends StatelessWidget {
  final String typeTitle;
  final String introduce;
  final String picture;
  final String buttonContent;
  HomeComponet(
      {required this.typeTitle,
      required this.introduce,
      required this.picture,
      required this.buttonContent});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 600,
                  height: 240,
                  decoration: BoxDecoration(
                      border: new Border.all(
                    color: Colors.grey,
                  )),
                  child: Column(
                    children: [
                      Container(
                        width: 600,
                        height: 170,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      typeTitle,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        introduce,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey),
                                        softWrap: true,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Image.asset("images/$picture"),
                            )
                          ],
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(builder: (context)=>new TextPage()));
                            },
                            child: Text(
                              buttonContent,
                              style: TextStyle(color: Colors.red),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              side: BorderSide(width: 2, color: Colors.red),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//  "模拟考试"
//  "仿真考试场景,1:1匹配各种题型。多达30套完整试卷."
// "images/buttonLogo.png"
// GO