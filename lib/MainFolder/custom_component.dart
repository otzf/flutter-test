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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Button tap logic
          },
          child: Text(buttonText),
        ),
        SizedBox(height: 8),
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
              100, // Adjust this value to change the size of the CircleAvatar
          backgroundImage: AssetImage("images/$imageName"),
        ),
      ],
    );
  }
}
