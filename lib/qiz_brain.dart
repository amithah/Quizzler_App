import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      'Flutter is developed by FaceBook',
      false,
    ),
    Question(
      ' Flutter is free and open-source',
      true,
    ),
    Question(
      'Flutter is a programming language',
      false,
    ),
    Question(
      'The first alpha version of Flutter was released in 2021',
      false,
    ),
  ];
  bool nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      return false;
    } else {
      _questionNumber = 0;
      return true;
    }
  }

  String? getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool? getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
