import 'question.dart';

class QuizBrain {

  int _questionNumber = 0;
  final List <Question> _questionBank = [
    Question('Is C++ is Object Oriented',true),
    Question('React is Framework of Ruby ?',false),
    Question('Is Earth Round ?',true)
  ];

  void nextQuestion(){

    if(_questionNumber < _questionBank.length - 1){
      _questionNumber++;
    }
  }

  int getLengthOfQuestions(){
    return _questionBank.length;
  }

  int getQuestionNumber(){
    return _questionNumber;
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAns(){
    return _questionBank[_questionNumber].questionAns;
  }
}