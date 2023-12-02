import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'packageText/RadioPack.dart';
import 'PageConpenont/page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API 数据展示示例',
      home: MyPackage(),
    );
  }
}

// class MyPackage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyPackage();
// }

// class _MyPackage extends State<MyPackage> {
//   // late Future<List<RadioContent>> futureRadio;
//   // late RadioPackage radioPackage;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   radioPackage =
//   //       RadioPackage("http://192.168.31.149:1338/api/radio-contents");
//   //   futureRadio = radioPackage.fetchRadio();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("封装api"),
//       ),
//       // body: FutureBuilder(
//       //     future: futureRadio,
//       //     builder: (context, snapshot) {
//       //       if (snapshot.connectionState == ConnectionState.waiting) {
//       //         return Center(
//       //           child: CircularProgressIndicator(),
//       //         );
//       //       } else if (snapshot.hasError) {
//       //         return Center(
//       //           child: Text("${snapshot.hasError}"),
//       //         );
//       //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//       //         return Center(child: Text("value is null"));
//       //       } else {
//       //         return MusicTheoryQuiz();
             
//       //       }
//       //     }),
//       body: 
//     );
//   }
// }
class MyPackage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("封装好的"),),
      body: MusicTheoryQuiz(),
    );
  }
}