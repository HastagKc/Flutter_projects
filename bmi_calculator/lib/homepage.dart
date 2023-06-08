import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating variable
  TextEditingController _massController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator '),
      ),
      body: Container(
        height: 200,
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                onPressed: () {}, child: const Text('View Results ')),
          ],
        ),
      ),
    );
  }
}
