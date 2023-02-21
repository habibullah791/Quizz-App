import 'package:flutter/material.dart';
import 'quizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(AppBody());
}

class AppBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
            child: Text(
              'Quizz App'
            ),
          ),
        ),
        body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: QuizzApp(),
            )
        ),
      ),
    );
  }
}


class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {

  List <Icon> scoreKeeper = [];

  void addIconToList(bool ans){

    bool correctAns = quizBrain.getQuestionAns();

    if ( correctAns == ans ) {
      scoreKeeper.add(
        const Icon(Icons.check, color: Colors.green,)
      );
    }
    else{
      scoreKeeper.add(
          const Icon(Icons.close, color: Colors.red,)
      );
    }

    quizBrain.nextQuestion();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:  <Widget> [
          Expanded(
            flex: 6,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: (){
                    setState(() {
                      addIconToList(true);
                    });
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: (){
                    setState(() {
                      addIconToList(false);
                    });
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
          ),
          Container(
            height: 25.0,
            child: Row(
              children: scoreKeeper,
            ),
          )
      ]
    );
  }
}
