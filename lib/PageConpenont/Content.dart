import 'package:flutter/material.dart';

class content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(15),
      width: 400,
      height: 680,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 1),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 300,
            height: 400,
         
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "须知:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  
                ),
              
                Text(
                  "·向镜头展示所有草稿纸，以确定他们是空白的",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                  maxLines: 2,
                ),
               
                  Text(
                  "·确保镜头没有被遮挡并拍摄到你",
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                  Text(
                  "·确保负责成年人（如在场）知道考试已经开始",
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                  Text(
                  "·在考试中不可以使用任何未经授权的材料",
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                   Text(
                  "·如果与其他考生一起参加考试，请注明“我在与其他考生一起参加考试，负责成年人也在场",
                  style: TextStyle(fontSize: 16),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 100,
            margin: EdgeInsets.all( 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "信息:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                  Text(
                  "·本试卷共有七部分",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                ),
                  Text(
                  "·满分为75分",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
            Container(
            width: 300,
            height: 130,
            margin: EdgeInsets.all( 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "建议:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                  Text(
                  "·做每题前先仔细读题",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                ),
                  Text(
                  "·尽量回答每个问题",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                ),
                  Text(
                  "·最后如有时间，检查你的答案",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
