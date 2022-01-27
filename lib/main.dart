import 'package:flutter/material.dart';
import 'package:mcq/src/quize.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuizBrain quiz_brain = QuizBrain();

  RandomText() {
    setState(() {
      quiz_brain.RandomQuestion();
    });
  }

  changeText() {
    setState(() {
      quiz_brain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    String QuestionText = quiz_brain.getQuestionText(); //Question Goes Here
    bool AnswerText = quiz_brain.getCorrectAnswer(); //Answer Goes Here
    return Scaffold(
        appBar: AppBar(title: Text('Quiz Bank'),centerTitle: true,),
        body: Center(
            child: Column(children: [
              SizedBox(
                height: 70.0,
              ),
              Text(
                '$QuestionText',
              ),
              Text(
                '$AnswerText',
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: Text('Next Question'),
                  onPressed: () {
                    changeText();
                  }),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: Text('Random Question'),
                  onPressed: () {
                    RandomText();
                  })
            ])));
  }
}