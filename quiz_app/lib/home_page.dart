import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating list
  List<QuestionModel> questionList = [
    QuestionModel(
      question:
          'Which of the following is the largest organ in the human body?',
      options: ['Liver', 'Skin', 'Heart', 'Lungs'],
      answer: 'Skin',
    ),
    QuestionModel(
      question: 'What is the function of the pancreas?',
      options: [
        'Producing insulin',
        'Filtering blood',
        'Pumping oxygenated blood',
        'Digesting food'
      ],
      answer: 'Producing insulin',
    ),
    QuestionModel(
      question:
          'Which of the following is responsible for carrying oxygen to the body\'s cells?',
      options: [
        'White blood cells',
        'Platelets',
        'Red blood cells',
        'Plasma',
      ],
      answer: 'Red blood cells',
    ),
    QuestionModel(
      question: 'What is the normal resting heart rate for adults?',
      options: [
        '60-80 beats per minute',
        '100-120 beats per minute',
        '40-60 beats per minute',
        '80-100 beats per minute',
      ],
      answer: '60-80 beats per minute',
    ),
    QuestionModel(
      question: 'What is the function of the cerebellum?',
      options: [
        ' Controlling voluntary muscle movements',
        'Regulating body temperature',
        'Balancing and coordination',
        'Processing visual information',
      ],
      answer: 'Balancing and coordination',
    ),
    QuestionModel(
      question: 'Which of the following is responsible for the sense of taste?',
      options: [
        'Olfactory nerve',
        'Optic nerve',
        'Auditory nerve',
        'Gustatory nerve',
      ],
      answer: 'Gustatory nerve',
    ),
    QuestionModel(
      question:
          'Which part of the human brain is associated with memory and learning?',
      options: [
        'Cerebrum',
        ' Cerebellum',
        'Medulla oblongata',
        'Hippocampus',
      ],
      answer: 'Hippocampus',
    ),
    QuestionModel(
      question: 'What is the function of the adrenal glands?',
      options: [
        'Regulating metabolism',
        'Producing hormones for stress response',
        'Filtering waste from the blood',
        'Controlling body temperature',
      ],
      answer: 'Producing hormones for stress response',
    ),
    QuestionModel(
      question: 'Which of the following is not a type of muscle tissue?',
      options: [
        'Skeletal muscle',
        'Cardiac muscle',
        'Smooth muscle',
        'Nervous muscle',
      ],
      answer: 'Nervous muscle',
    ),
    QuestionModel(
      question: 'What is the primary function of the respiratory system?',
      options: [
        'Pumping blood to the body',
        'Digesting food',
        'Exchanging oxygen and carbon dioxide',
        'Filtering waste from the blood'
      ],
      answer: 'Exchanging oxygen and carbon dioxide',
    ),
  ];

  int currentQesIndex = 0;
  var totalScore = 0;
  // creating function to check answer
  void checkAnswer(String selectedAnswer) {
    // storing currect answer int the correctAns variable
    if (currentQesIndex < questionList.length) {
      if (selectedAnswer == questionList[currentQesIndex].answer) {
        totalScore++;
        setState(() {
          currentQesIndex++;

          print('set call and score ${totalScore}');
        });
      } else {
        setState(() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("! Oops Wrong Answer"),
                content: Text(
                  'Corrent answer is: ${questionList[currentQesIndex].answer}',
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQesIndex++;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Next'),
                  ),
                ],
              );
            },
          );
        });
      }
    } else {
      print('Nothing');
    }
  }

// reset function
  dynamic resetQuiz() {
    setState(() {
      totalScore = 0;
      currentQesIndex = 0;
    });

    return currentQesIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz time'),
      ),
      body: (currentQesIndex <= questionList.length - 1)
          ? Center(
              child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  width: 320,
                  height: 380,
                  // color: Colors.grey,
                  child: Column(
                    children: [
                      Text(
                        questionList[currentQesIndex].question,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Column(
                        children:
                            questionList[currentQesIndex].options.map((answer) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100.0, 50.0),
                              ),
                              onPressed: () {
                                print(answer);
                                checkAnswer(answer);
                              },
                              child: Text(answer),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: ScorePage(
                score: totalScore,
                resetQuiz: resetQuiz,
              ),
            ),
    );
  }
}

class ScorePage extends StatelessWidget {
  var score;
  VoidCallback resetQuiz;
  ScorePage({
    Key? key,
    required this.score,
    required this.resetQuiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulation",
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text('Your Score is ${score}'),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                resetQuiz();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }),
                );
              },
              child: const Text("Try Again "),
            ),
          ],
        ),
      ),
    );
  }
}
