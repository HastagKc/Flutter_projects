import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating variable
  TextEditingController _massController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  // creating bool variable
  bool isVisiable = false;

  String messageValue = '';
  double result = 0.0;

  @override
  void dispose() {
    super.dispose();
    _massController.dispose();
    _heightController.dispose();
  }

  // creating function which calculate BMI
  void updateMessage(double mass, double height) {
    mass = double.parse(_massController.text.trim());
    height = double.parse(_heightController.text.trim());

    if (mass != null && height != null) {
      result = mass / (height * height);

      if (result < 18.25) {
        messageValue = 'Under Weight';
      } else if (result > 18.5 || result < 24.9) {
        messageValue = 'Normal';
      } else if (result >= 25 && result <= 29.9) {
        messageValue = 'Over Weight';
      } else if (result >= 30 && result <= 39.9) {
        messageValue = 'Obesity';
      } else {
        messageValue = 'Extreme Obesity';
      }

      _massController.clear();
      _heightController.clear();
      result.toStringAsFixed(2);
      isVisiable = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator '),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          color: const Color.fromARGB(255, 221, 170, 94),
          // color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _massController,
                      decoration: const InputDecoration(
                        label: Text('Enter Mass'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Kg',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        label: Text('Enter height'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Meter',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateMessage(
                      double.parse(_massController.text.trim()),
                      double.parse(_heightController.text.trim()),
                    );
                  });
                },
                child: const Text('View Results '),
              ),
              const SizedBox(height: 20),
              isVisiable
                  ? Column(
                      children: [
                        Text(
                          'Your BMI score is: ${result.toStringAsFixed(3)}',
                          style: const TextStyle(fontSize: 25.0),
                        ),
                        Text(
                          'BMI Report: $messageValue',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
