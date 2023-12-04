import 'package:flutter/material.dart';
import 'package:test1/MainPage/test2.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String selectedValue = '操作'; // Default value
  int currentPageIndex = 1; // Default page index

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // 切换到前一页
                  if (currentPageIndex > 1) {
                    setState(() {
                      currentPageIndex--;
                    });
                    loadQuestionForCurrentPage();
                  }
                },
                child: Text("<<"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  fixedSize: Size(30, 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 切换到下一页
                  if (currentPageIndex < 3) {
                    setState(() {
                      currentPageIndex++;
                    });
                    loadQuestionForCurrentPage();
                  }
                },
                child: Text(">>"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              if (newValue != null && newValue != '操作') {
                setState(() {
                  selectedValue = newValue;
                });
                // 根据选择的值进行相应的操作，比如加载题目
                loadQuestionForCurrentPage();
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

  void loadQuestionForCurrentPage() {
    // 根据当前页码和选择的值加载题目
    // 这里你需要根据你的业务逻辑来获取对应的题目数据
    // 这里只是一个示例，你需要替换成实际的加载数据的逻辑
    print('Load question for page $currentPageIndex and option $selectedValue');
  }
}
