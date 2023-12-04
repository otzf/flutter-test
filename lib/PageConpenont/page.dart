import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test1/packageText/RadioPack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicTheoryQuiz extends StatefulWidget {
  @override
  _MusicTheoryQuizState createState() => _MusicTheoryQuizState();
}

class _MusicTheoryQuizState extends State<MusicTheoryQuiz> {
  String? selectedTimeSignature;
  late Future<List<RadioContent>> futureRadio;
  final api = "http://192.168.31.149:1338/api/radio-contents";
  List<RadioContent> selectedQuestions = [];
  bool allowAutoSwitch = true;

  @override
  void initState() {
    super.initState();
    futureRadio = fetchRadio();
    loadSelectedQuestion();
  }

  Future<List<RadioContent>> fetchRadio() async {
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      print("API Response: ${jsonResponse}");

      if (jsonResponse.containsKey("data") && jsonResponse['data'] is List) {
        List<dynamic> data = jsonResponse['data'];
        return data
            .map((item) => RadioContent.fromJson(item['attributes']))
            .toList();
      } else {
        throw Exception("data key not found");
      }
    } else {
      throw Exception("failed to load");
    }
  }

  Future<void> loadSelectedQuestion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? selectedQuestionIndex = prefs.getInt('selectedQuestionIndex');

    print("Selected question index: $selectedQuestionIndex");

    if (selectedQuestionIndex != null) {
      List<RadioContent> allQuestions = await futureRadio;
      setState(() {
        selectedQuestions = [allQuestions[selectedQuestionIndex]];
      });
    }
  }

  Future<void> saveSelectedQuestionIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedQuestionIndex', index);
  }

  List<RadioContent> selectRandomQuestions(
      List<RadioContent> allQuestions, int numberOfQuestions) {
    final List<RadioContent> shuffledQuestions = List.from(allQuestions)
      ..shuffle();
    return shuffledQuestions.take(numberOfQuestions).toList();
  }

void switchQuestion() async {
  List<RadioContent> allQuestions = await futureRadio;

  setState(() {
    if (selectedQuestions.isEmpty) {
      selectedQuestions = [allQuestions[0]];
    } else {
      int currentIndex = selectedQuestions[0].id ?? 0;
      int newIndex = (currentIndex + 1) % allQuestions.length;
      selectedQuestions = [allQuestions[newIndex]];
      selectedTimeSignature = null;
      allowAutoSwitch = false;
    }

    // Re-fetch questions only when allowAutoSwitch is true
    if (allowAutoSwitch) {
      fetchRadio().then((newQuestions) {
        setState(() {
          selectedQuestions = newQuestions;
        });
        saveSelectedQuestionIndex(selectedQuestions[0].id ?? 0);
      });
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadioContent>>(
      future: futureRadio,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text("No data available"),
          );
        } else {
          List<RadioContent> allQuestions = snapshot.data!;

          if (allowAutoSwitch) {
            selectedQuestions = selectRandomQuestions(allQuestions, 1);
            print("Data length: ${allQuestions.length}");
          }

          return ListView.builder(
            itemCount: selectedQuestions.length,
            itemBuilder: (content, index) {
              RadioContent content = selectedQuestions[index];

              print("Selected question: $content");

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 350,
                    height: 150,
                    child: Image.asset(
                      'images/subject/radioPic/${content.pic}',
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: RadioListTile(
                      title: Text(content.choose1),
                      value: content.choose1,
                      groupValue: selectedTimeSignature,
                      onChanged: (value) {
                        setState(() {
                          selectedTimeSignature = value;
                          print(selectedTimeSignature);
                          if (allowAutoSwitch) {
                            saveSelectedQuestionIndex(content.id ?? 0);
                            switchQuestion();
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: RadioListTile(
                      title: Text(content.choose2),
                      value: content.choose2,
                      groupValue: selectedTimeSignature,
                      onChanged: (value) {
                        setState(() {
                          selectedTimeSignature = value;
                          print(selectedTimeSignature);
                          if (allowAutoSwitch) {
                            saveSelectedQuestionIndex(content.id ?? 0);
                            switchQuestion();
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: RadioListTile(
                      title: Text(content.choose3),
                      value: content.choose3,
                      groupValue: selectedTimeSignature,
                      onChanged: (value) {
                        setState(() {
                          selectedTimeSignature = value;
                          print(selectedTimeSignature);
                          if (allowAutoSwitch) {
                            saveSelectedQuestionIndex(content.id ?? 0);
                            switchQuestion();
                          }
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        allowAutoSwitch = true; // Setting it to true here
                      });
                      switchQuestion();
                    },
                    child: Text('切换问题'),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
