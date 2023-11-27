import 'package:flutter/material.dart';
// 第一题模板
class MusicTheoryQuiz extends StatefulWidget {
  @override
  _MusicTheoryQuizState createState() => _MusicTheoryQuizState();
}

class _MusicTheoryQuizState extends State<MusicTheoryQuiz> {
  String? selectedTimeSignature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          RadioListTile<String>(
            title: Text('4/4'),
            value: '4/4',
            groupValue: selectedTimeSignature,
            onChanged: (value) {
              setState(() {
                selectedTimeSignature = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('3/4'),
            value: '3/4',
            groupValue: selectedTimeSignature,
            onChanged: (value) {
              setState(() {
                selectedTimeSignature = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('6/8'),
            value: '6/8',
            groupValue: selectedTimeSignature,
            onChanged: (value) {
              setState(() {
                selectedTimeSignature = value;
              });
            },
          ),
          SizedBox(height: 16),
        
        ],
      ),
    );
  }
}