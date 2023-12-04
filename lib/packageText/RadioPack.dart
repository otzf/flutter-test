import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RadioContent {
  final int? id;
  final String choose1;

  final String choose2;
  final String choose3;
  final String pic;
  RadioContent({required this.id,required this.choose1,required this.choose2,required this.choose3,required this.pic});
  factory RadioContent.fromJson(Map<String,dynamic> json){
    return RadioContent(
       id: json['id'],
      choose1: json['choose1']??'',
      choose2: json['choose2']??'',
      choose3: json['choose3']??'',
      pic: json['pic']??'',
    );
  }
}

// class RadioPackage {

//   final String api;
//   RadioPackage(this.api);
//   Future<List<RadioContent>> fetchRadio() async{
//     // 先获取响应
//     final response= await http.get(Uri.parse(api));
//     //判断返回的响应状态
//     if(response.statusCode ==200){
//       // decode是将响应的json数据转换为dart对象
//       dynamic jsonResponse =json.decode(response.body);
//       // 如果响应的dart对象包含data属性，并且data属性是一个list数组
//       if(jsonResponse.containsKey("data")&& jsonResponse['data'] is List){
//         // 定义一个data的list数组用来存放响应的data数据
//         List<dynamic> data =jsonResponse['data'];
//         return data.map((item) => RadioContent.fromJson(item['attributes'])).toList();
//       }else{
//         throw Exception("data key not find");
//       }
//     }else {
//       throw Exception("fialed to load");
//     }
//   }

 
// }