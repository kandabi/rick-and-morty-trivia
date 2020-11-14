import 'package:flutter/material.dart';

//** Trivia Question data structure. */
class TriviaQuestion {
  String question;
  int answerIndex;
  List<String> answers;

  TriviaQuestion(String _question, int _answerIndex, List<String> _answers) {
    question = _question;
    answerIndex = _answerIndex;
    answers = _answers;
  }
}

//*** The trivia page widget, takes in a TriviaQuestion class and constructs the trivia question with three buttons.  */
class TriviaPage extends StatelessWidget {
  @required //*** Will not compile without a valid TriviaQuestion parameter passed in.  */
  final TriviaQuestion triviaQuestion;
  const TriviaPage({Key key, this.triviaQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            triviaQuestion.question, //** Display the question here */
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 35.0),
        ),
        ElevatedButton(
            child: Text(triviaQuestion.answers[0]),
            //*** Returns to the previous page with the button index selected. */
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 0);
            }),
        ElevatedButton(
            child: Text(triviaQuestion.answers[1]),
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 1);
            }),
        ElevatedButton(
            child: Text(triviaQuestion.answers[2]),
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 2);
            }),
      ],
    ));
  }
}
