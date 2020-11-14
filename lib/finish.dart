import 'package:flutter/material.dart';

//*** Game over widget */
class FinishPage extends StatelessWidget {
  @required //*** The final score */
  final int score;
  @required //*** total num of questions */
  final int numOfQuestions;

  const FinishPage({Key key, this.score, this.numOfQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/yes.jpg',
          width: 350,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60.0),
        ),
        Center(
          child: Text(
            "You scored $score\\$numOfQuestions",
          ),
        ),
        ElevatedButton(
          //*** Returns to the home page. */
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Return to home page.'),
        ),
      ],
    ));
  }
}
