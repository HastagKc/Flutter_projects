import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.amber,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Todo List'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Todo'),
                  content: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            label: Text('Todo Task'),
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 7,
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text('Datetime'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial,
                                  );
                                  if (pickedTime != null) {
                                    print(pickedTime);
                                  }
                                },
                                icon: const Icon(Icons.alarm_add),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // writing header of the app
            const Text(
              'Todo List',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'You have ${todos.length} todos',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Creating body
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  var todo = todos[index];
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 6,
                          child: ListTile(
                            title: Text(
                              todo.dataTime.toString(),
                            ),
                            subtitle: Text(
                              todo.task.toString(),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.edit),
                              Icon(Icons.delete),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
