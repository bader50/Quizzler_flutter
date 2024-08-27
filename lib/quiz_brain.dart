import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question(
        'Approximatively one quarter of human bones are on the feet.', true),
    Question('A slug\'s blood is green.', true)
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isLastQuestion() {
    return _questionNumber == _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
