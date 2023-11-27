import 'package:flutter/material.dart';
import '../PageConpenont/titleComponent.dart';
import '../PageConpenont/page.dart';
import '../PageConpenont/bottomBar.dart';


class MyMusicTheoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
            
          title: titleComponent(),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
           Container(
            width: 400,
            height: 700,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                  Container(
                    width: 350,
                    height: 100,
                    child: Text('为下面小节选择正确的拍子记号'),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                      Container(
                    width: 350,
                    height: 150,
                    child: Image.asset('images/page1.png'),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 300,
                    child: MusicTheoryQuiz(),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)
                    ),
                  )
              ],
            )
           ),
          BottomBar()
          ],
        )
      ),
    );
  }
}

