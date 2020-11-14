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

//*** Instantiates all the questions inside a List, this is ugly and should be stored in a json file. */
List<TriviaQuestion> createTriviaQuestions() {
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

  return triviaQuestions;
}
