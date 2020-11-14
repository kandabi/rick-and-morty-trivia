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
          padding: EdgeInsets.only(bottom: 25.0),
        ),
        Center(
          child: Text(
            "You scored $score\\$numOfQuestions",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
        ),
        ElevatedButton(
          //*** Returns to the home page. */
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Return to home page.',
            style: TextStyle(fontSize: 20, height: 1.3),
          ),
        ),
      ],
    ));
  }
}
