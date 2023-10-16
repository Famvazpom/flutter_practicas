import 'question.dart';

class QuizBrain {
  List<Question> _poll = [
    Question(q: "Sharks are mammals.", a: false),
    Question(
        q: "Sea otters have a favorite rock they use to break open food.",
        a: true),
    Question(
        q: "The blue whale is the biggest animal to have ever lived.", a: true),
    Question(
        q: "The hummingbird egg is the world's smallest bird egg.", a: true),
    Question(
        q: "Pigs roll in the mud because they don't like being clean.",
        a: false),
    Question(q: "Bats are blind.", a: false),
  ];

  int _actualQuestion = 0;
  int _correctPoints = 0;
  int _incorrectPoints = 0;

  String getQuestion() {
    return _poll[_actualQuestion].questionText;
  }

  bool lastQuestion() {
    if (_actualQuestion == _poll.length - 1) return true;
    return false;
  }

  void changeQuestion() {
    if (_actualQuestion < _poll.length - 1) {
      _actualQuestion++;
    }
  }

  bool checkAnswer(bool usrInput) {
    if (usrInput == _poll[_actualQuestion].answer) {
      _correctPoints++;
      return true;
    }
    _incorrectPoints++;
    return false;
  }

  int getcorrectPoints() {
    return _correctPoints;
  }

  int getincorrectPoints() {
    return _incorrectPoints;
  }

  void restartGame() {
    _actualQuestion = 0;
    _correctPoints = 0;
    _incorrectPoints = 0;
  }
}
