import 'package:flutter/material.dart';
import 'package:quizapp/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
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
      body: Container(
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
                    questionBank[4].questionText,
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
                    return _checkAnswer();
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
                    return _checkAnswer();
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
                    return _checkAnswer();
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
      ),
    );
  }

  Widget _checkAnswer() {}
}
