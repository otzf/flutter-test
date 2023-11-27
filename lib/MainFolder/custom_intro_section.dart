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
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
            // child:Padding(
              // padding: EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            // )
    ),
        Expanded(
          flex: 3,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            style: TextStyle(
              fontSize: screenWidth * 0.02,
            ),
            description,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),),
        SizedBox(height: 20.0),
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
        SizedBox(height: 20.0),
      ],
    );
  }
}
