import 'package:flutter/material.dart';
import 'package:quizapp/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question(
        questionText:
            'The U.S. Declaration of Independence was adopted in 1776',
        isCorrect: true),
    Question(
        questionText: 'The Supreme law of the land is the Constitution',
        isCorrect: true),
    Question(
        questionText:
            'The two rights in the Declaration of the Independence are:'
            ' \n Life '
            ' \n Pursuit of happiness.',
        isCorrect: true),
    Question(
        questionText: 'The (U.S.) Constitution has 26 Amendments',
        isCorrect: false),
    Question(
        questionText: 'Journalist is one branch or part of the government.',
        isCorrect: false),
    Question(
        questionText: 'The Congres does not make federallaws.',
        isCorrect: false),
    Question(questionText: 'There are 100 U.S. Senators.', isCorrect: true),
    Question(
        questionText: 'We vote for President in January.', isCorrect: false),
    Question(
        questionText: 'The Constitution was written in 1787.', isCorrect: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True Citizen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/flag.png',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(color: Colors.blueGrey.shade400)),
                  height: 120,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      return _previousQuestion();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      return _checkAnswer(true, context);
                    },
                    child: Text(
                      'TRUE',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      return _checkAnswer(false, context);
                    },
                    child: Text(
                      'FALSE',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      return _nextQuestion();
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        );
      }),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snack = SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text(
            'Correct answer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      _updateQuestion();
    } else {
      final snack = SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text(
            'Incorrect answer',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
