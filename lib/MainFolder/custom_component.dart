import 'package:flutter/material.dart';

class CustomComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String imageName;

  CustomComponent({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth =MediaQuery.of(context).size.width;
    final smallTitle =24.0;
    final smallbuttonText =18.0;
    final fontsize1 =screenWidth*0.02;
    final fontsize2 =screenWidth*0.01;
    final rediusSize1 = 100.0;
    final rediusSize2 = screenWidth*0.25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth>600 ?fontsize1 :smallTitle,
          ),
        ),
        // SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
                        fontSize: screenWidth>600 ?fontsize1 :smallbuttonText,

          ),
        ),
        // SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Button tap logic
          },
          child: Text(buttonText),
        ),
        // SizedBox(height: 8),
        // CircleAvatar(
        //   radius: 50,
        //   child: ClipOval(
        //     child: Image.asset(
        //       "images/$imageName",
        //       width: 150, // Set this to the desired width of the image
        //       height: 150, // Set this to the desired height of the image
        //       fit: BoxFit
        //           .cover, // This will cover the area without changing the aspect ratio
        //     ),
        //   ),
        // ),
        CircleAvatar(
          radius:
              screenWidth>600 ?rediusSize2:rediusSize1, // Adjust this value to change the size of the CircleAvatar
          backgroundImage: AssetImage("images/$imageName"),
        ),
      ],
    );
  }
}
