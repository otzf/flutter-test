import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RadioContent {
  final String choose1;
  final String choose2;
  final String choose3;
  final String pic;
  RadioContent({required this.choose1,required this.choose2,required this.choose3,required this.pic});
  factory RadioContent.fromJson(Map<String,dynamic> json){
    return RadioContent(
      choose1: json['choose1']??'',
      choose2: json['choose2']??'',
      choose3: json['choose3']??'',
      pic: json['pic']??'',
    );
  }
}

class RadioPackage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RadioPackage();
}
class _RadioPackage extends State<RadioPackage>{
  final api ="http://192.168.31.149:1338/api/radio-contents";
  late Future<List<RadioContent>> futureRadio;
  Future<List<RadioContent>> fatchRadio() async{
    // 先获取响应
    final response= await http.get(Uri.parse(api));
    //判断返回的响应状态
    if(response.statusCode ==200){
      // decode是将响应的json数据转换为dart对象
      dynamic jsonResponse =json.decode(response.body);
      // 如果响应的dart对象包含data属性，并且data属性是一个list数组
      if(jsonResponse.containsKey("data")&& jsonResponse['data'] is List){
        // 定义一个data的list数组用来存放响应的data数据
        List<dynamic> data =jsonResponse['data'];
        return data.map((item) => RadioContent.fromJson(item['attributes'])).toList();
      }else{
        throw Exception("data key not find");
      }
    }else {
      throw Exception("fialed to load");
    }
  }
  @override
  void initState(){
    super.initState();
    futureRadio =fatchRadio();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("api测试"),backgroundColor: Colors.blue,),
      body: FutureBuilder<List<RadioContent>>(
        future: fatchRadio(),
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"),);
          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("no data avilable"),);
          }else{
            List<RadioContent> contents =snapshot.data!;
            return ListView.builder(
              itemCount: contents.length,
              itemBuilder:(context,index){
                RadioContent content =contents[index];
                return Column(
                  children: [
                    Text("${content.choose1}"),
                    Text("${content.choose2}"),
                    Text("${content.choose3}"),
                    Image.asset("${content.pic}"),

                  ],
                );
              } 
              );
          }
        }
      )
    );
  }
}