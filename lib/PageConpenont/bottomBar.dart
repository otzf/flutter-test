import 'package:flutter/material.dart';
import 'package:test1/MainPage/test2.dart';
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String selectedValue = '操作'; // Default value

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:   Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("<<"),
                
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                   fixedSize: Size(30, 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Info"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Info"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("1"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                     Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MyMusicTheoryApp()));
                },
                child: Text(">>"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              )
            ],
          ),
          ),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              if (newValue != null && newValue != '操作') {
                setState(() {
                  selectedValue = newValue;
                });
              }
            },
            items: <String>['操作', '选项一', '选项二', '选项三']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
