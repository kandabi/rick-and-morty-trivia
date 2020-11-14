import 'package:flutter/material.dart';
import 'trivia_data.dart';

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
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Text(
              triviaQuestion.question, //** Display the question here */
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 35.0),
        ),
        ElevatedButton(
            child:
                Text(triviaQuestion.answers[0], style: TextStyle(fontSize: 20)),
            //*** Returns to the previous page with the button index selected. */
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 0);
            }),
        ElevatedButton(
            child:
                Text(triviaQuestion.answers[1], style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 1);
            }),
        ElevatedButton(
            child:
                Text(triviaQuestion.answers[2], style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context, triviaQuestion.answerIndex == 2);
            }),
      ],
    ));
  }
}
