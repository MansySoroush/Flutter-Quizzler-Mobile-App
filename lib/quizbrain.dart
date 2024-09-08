import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question("A slug's blood is green.", true),
    Question("The loudest animal is the African Elephant.", false),
    Question("Approximately one quarter of human bones are in the feet.", true),
    Question(
        "The total surface area of a human lungs is the size of a football pitch.",
        true),
    Question(
        "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
        true),
    Question(
        "In London, UK, if you happen to die in the House of Parliament, you are entitled to a state funeral.",
        false),
    Question("It is illegal to pee in the Ocean in Portugal.", true),
    Question("You can lead a cow down stairs but not up stairs.", false),
    Question("Google was originally called 'Backrub'.", true),
    Question("Buzz Aldrin's mother's maiden name was 'Moon'.", true),
    Question(
        "No piece of square dry paper can be folded in half more than 7 times.",
        false),
    Question("A few ounces of chocolate can to kill a small dog.", true),
  ];

  QuizBrain();

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  Question getQuestion() {
    return _questionBank[_questionIndex];
  }

  int getQuestionCount() {
    return _questionBank.length;
  }

  bool isFinished() {
    return (_questionIndex >= _questionBank.length - 1);
  }

  void reset() {
    _questionIndex = 0;
  }
}
