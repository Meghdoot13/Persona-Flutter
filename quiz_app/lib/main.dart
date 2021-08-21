import 'package:flutter/material.dart';

import 'package:quiz_app/Answers.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var questions = [
    {
      'question': 'What is your favourite colour',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 2},
        {'text': 'Yellow', 'score': 3},
        {'text': 'White', 'score': 4},
      ],
    },
    {
      'question': 'What is your favourite food',
      'answers': [
        {'text': 'Pizza', 'score': 2},
        {'text': 'Rice', 'score': 0},
        {'text': 'Pasta', 'score': 4},
        {'text': 'Egg', 'score': 3},
      ],
    },
    {
      'question': 'What is your favourite animal',
      'answers': [
        {'text': 'Dog', 'score': 4},
        {'text': 'Cat', 'score': 3},
        {'text': 'Lion', 'score': 2},
        {'text': 'Camel', 'score': 0},
      ],
    },
  ];

  var questionIndex = 0;
  var totalScore = 0;

  void reset(){
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void questionAnswer(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
  }

  String get resultPhase {
    var resultText;

    if (totalScore == 0) {
      resultText = 'you need a buddy bro';
    } else if (totalScore <= 4) {
      resultText = 'you are good';
    } else {
      resultText = 'damn bro what a personality';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: questionIndex < questions.length
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    questions[questionIndex]['question'] as String,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...(questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => questionAnswer(answer['score'] as int),
                        answer['text'] as String);
                  }).toList()
                ],
              )
            : Center(
                child: Column(
                  children: [
                    Text(
                      resultPhase,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      onPressed: reset,
                      child: Text(
                        'Reset Quiz',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.purple,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
