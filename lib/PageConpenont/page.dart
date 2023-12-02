import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test1/packageText/RadioPack.dart';

// 第一题模板
class MusicTheoryQuiz extends StatefulWidget {
  @override
  _MusicTheoryQuizState createState() => _MusicTheoryQuizState();
}

class _MusicTheoryQuizState extends State<MusicTheoryQuiz> {
  String? selectedTimeSignature;
  late Future<List<RadioContent>> futureRideo;
  final api = "http://192.168.31.149:1338/api/radio-contents";
  @override
  void initState() {
    super.initState();
    futureRideo = fetchRadio();
  }

  Future<List<RadioContent>> fetchRadio() async {
    // 先获取响应
    final response = await http.get(Uri.parse(api));
    //判断返回的响应状态
    if (response.statusCode == 200) {
      // decode是将响应的json数据转换为dart对象
      dynamic jsonResponse = json.decode(response.body);
      // 如果响应的dart对象包含data属性，并且data属性是一个list数组
      if (jsonResponse.containsKey("data") && jsonResponse['data'] is List) {
        // 定义一个data的list数组用来存放响应的data数据
        List<dynamic> data = jsonResponse['data'];
        return data
            .map((item) => RadioContent.fromJson(item['attributes']))
            .toList();
      } else {
        throw Exception("data key not find");
      }
    } else {
      throw Exception("fialed to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadioContent>>(
        future: futureRideo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.hasError}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No data available"),
            );
          } else {
            List<RadioContent> contents = snapshot.data!;
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (content, index) {
                  // 先创建一个radiocontent类用来存放数据
                  RadioContent content = contents[1];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 350,
                        height: 150,
                        child: Image.asset(
                            'images/subject/radioPic/${content.pic}'),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      Container(
                        height: 100,
                        child: RadioListTile(title: Text(content.choose1),value: content.choose1, groupValue: selectedTimeSignature, onChanged: (value){
                        setState(() {
                          selectedTimeSignature =value;
                          print(selectedTimeSignature);
                        });
                      }),
                      ),
                      Container(
                        height: 100,
                        child:   RadioListTile(title: Text(content.choose2),value: content.choose2, groupValue: selectedTimeSignature, onChanged: (value){
                        setState(() {
                          selectedTimeSignature =value;
                          print(selectedTimeSignature);
                        });
                      }),
                      ),
                      
                      Container(
                        height: 100,
                        child:   RadioListTile(title: Text(content.choose3),value: content.choose3, groupValue: selectedTimeSignature, onChanged: (value){
                        setState(() {
                          selectedTimeSignature =value;
                          print(selectedTimeSignature);
                        });
                      }),
                      )
                    ],
                  );
                });
          }
        });
  }
}
