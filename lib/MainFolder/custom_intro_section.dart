import 'package:flutter/material.dart';

class CustomIntroSection extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onFreeTrialPressed;
  final VoidCallback onLoginPressed;

  CustomIntroSection({
    required this.title,
    required this.description,
    required this.onFreeTrialPressed,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final fontsize1 = screenWidth * 0.04;
    final fontsize2 = screenWidth * 0.02;

    final smalltitle =19.0;
    final smallcontent =13.0;
    return Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // child:Padding(
        // padding: EdgeInsets.all(16.0),
       Container(
        width: 320,
        // height: 50,
        child:  Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth > 600 ? fontsize1 : smalltitle,
          ),
          textAlign: TextAlign.center,
        ),
       ),
        // )

        Container(
          width: 340,
          // height: 50,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              style: TextStyle(
               fontSize: screenWidth > 600 ? fontsize2 : smallcontent,
              ),
              description,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),
       
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: onFreeTrialPressed,
              child: Text('免费体验'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: onLoginPressed,
              child: Text('登录（已购买）'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
