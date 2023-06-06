import 'package:curd_operation/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Contact> constacts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curd Operation'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Contact'),
                  content: Column(
                    children: [
                      TextField(),
                      TextField(),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Add")),
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('data'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
