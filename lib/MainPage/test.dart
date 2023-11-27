import 'package:flutter/material.dart';
// import 'mainContent/HeaderPage.dart';
import '../PageConpenont/CountdownPage.dart';
import '../PageConpenont/pull_down_menu.dart';
import '../PageConpenont/titleComponent.dart';
import '../PageConpenont/Content.dart';
import '../PageConpenont/bottomBar.dart';


class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          // width: ,
          height: 50,
          child: titleComponent(),
        ),
        actions: [
          pullDown(
            items: [
              pullDownItem(
              value: 'english',
              name: 'En'
            ),
              pullDownItem(
              value: 'fan',
              name: '繁'
            ),
              pullDownItem(
              value: 'jian',
              name: '简'
            ),
              pullDownItem(
              value: 'over',
              name: '结束考试'
            ),
           
            ],
            onSelected: (value){
              if(value=='english'){

              }else if(value=='fan'){

              }else if(value =='jian'){

              }else if(value=='over'){

              }
             
            })
        ],
      ),
      body:ListView(
        children: [
          content(),
          BottomBar()
        ],
      )
    );
  }
}
// '清除', '标记'