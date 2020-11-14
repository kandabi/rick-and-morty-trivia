import 'package:flutter/material.dart';
import 'trivia_widget.dart';
import 'trivia_data.dart';
import 'finish_widget.dart';

void main() {
  runApp(MaterialApp(
    title: 'Rick and Morty Trivia',
    home: HomePage(triviaQuestions: createTriviaQuestions()),
  ));
}

//*** Home page widget, it is stateful as it needs to contain muteable variables to store the logic of the trivia game and to construct multiple trivia pages. */
class HomePage extends StatefulWidget {
  @required //*** Stores all the questions inside the home page widget */
  final List<TriviaQuestion> triviaQuestions;

  HomePage({Key key, this.triviaQuestions}) : super(key: key);
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Rick and Morty trivia!')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/home.jpg',
              width: 350,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25.0),
            ),
            Center(
              child: Text(
                'Rick and Morty Trivia, press to start!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 55.0),
            ),
            ElevatedButton(
              child: Text(
                'Start',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //*** Resets correct answers on new game. */
                correctAnswers = 0;
                startGame(context);
              },
            )
          ],
        ));
  }

  startGame(BuildContext context) async {
    //*** Loops through all the trivia questions. */
    for (var i = 0; i < widget.triviaQuestions.length; i++) {
      //*** Display the trivia page, and return the selected button's result. */
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TriviaPage(
                  //*** Constructs a new trivia page according to the loop's current index. */
                  triviaQuestion: widget.triviaQuestions[i],
                )),
      );
      if (result) correctAnswers++; //*** Increase the score. */
      print(result);
    }

    //*** Displays game over screen, passes the final score alongside the total amount of questions. */
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FinishPage(
                score: correctAnswers,
                numOfQuestions: widget.triviaQuestions.length,
              )),
    );
  }
}
