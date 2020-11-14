import 'package:flutter/material.dart';
import 'trivia.dart';
import 'finish.dart';

void main() {
  //*** Instantiates all the questions inside a List, this is ugly and should be stored in a json file. */
  List<TriviaQuestion> triviaQuestions = new List<TriviaQuestion>();

  triviaQuestions.add(new TriviaQuestion("what does wubba lubba dub dub mean?",
      1, ["Hello", "I'm in great pain", "how's it going?"]));

  triviaQuestions.add(new TriviaQuestion(
      "What is the name of Morty's crush?", 1, ["Summer", "Jessica", "Jerry"]));

  triviaQuestions.add(new TriviaQuestion(
      'Who killed Birdperson in a horrific turnabout during his wedding?',
      2,
      ["Morty", "Rick", "Tammy"]));

  triviaQuestions.add(new TriviaQuestion(
      "It's not uncommon to catch Beth drinking what?",
      0,
      ["Wine", "Water", "Diet Coke"]));

  triviaQuestions.add(new TriviaQuestion(
      "What is the name of the arcade Rick and Morty visited?",
      2,
      ["Atlantis", "Anatomy Park", "Blips and chitz"]));

  triviaQuestions.add(new TriviaQuestion(
      "Morty accidentally had a child who is half alien. What species is his non-human half?",
      2,
      ["Cromulan", "Gromflomite", "Gazorpazorp"]));

  triviaQuestions.add(new TriviaQuestion(
      "Which family member did Beth accidentaly shoot?",
      0,
      ["Mr. Poopy Butthole", "Summer", "Jerry"]));

  triviaQuestions.add(new TriviaQuestion(
      "Name the song Rick uses to save the Earth.",
      1,
      ["Rock Hortz", "Get Schwifty", "Stop, Drop and Slitz"]));

  triviaQuestions.add(new TriviaQuestion(
      "What was Jerry's most successful advertising pitch?",
      0,
      ["Hungry For Apples?", "Git em apples", "Big Apples"]));

  triviaQuestions.add(new TriviaQuestion(
      "How does Rick hop across universes and dimensions? ",
      1,
      ["A Sonic Screwdriver", "A Portal Gun", "A Puzzle Box"]));

  runApp(MaterialApp(
    title: 'Rick and Morty Trivia',
    home: HomePage(triviaQuestions: triviaQuestions),
  ));
}

//*** Home page widget, it is stateful as it contains the logic of the trivia game. */
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
              padding: EdgeInsets.only(bottom: 95.0),
            ),
            Center(
              child: Text(
                'Rick and Morty Trivia, press to start!',
              ),
            ),
            ElevatedButton(
              child: Text(
                'Start',
                textAlign: TextAlign.center,
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
