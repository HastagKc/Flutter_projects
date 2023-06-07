import 'package:curd_operation/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurdPage extends StatefulWidget {
  const CurdPage({super.key});

  @override
  State<CurdPage> createState() => _CurdPageState();
}

class _CurdPageState extends State<CurdPage> {
  // creating controllers
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  // Create list of users

  List<User> users = [
    User(name: 'Kshittiz', email: 'kc@gmail.com'),
    User(name: 'Horizan', email: 'ho@gmail.com'),
  ];

  void addUser() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      users.add(User(name: name, email: email));
      _nameController.clear();
      _emailController.clear();
    }
  }

  // creating delete method

  void deleteUser(int index) {
    users.removeAt(index);
  }

  // update list

  void updateUser(int index, String name, String email) {
    users[index] = User(name: name, email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add User'),
                  content: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 200.0,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  addUser();
                                });
                                Get.back();
                              },
                              child: const Text('Save'),
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
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text('${users[index].name}'),
                  subtitle: Text('${users[index].email}'),
                  trailing: Container(
                    // decoration: BoxDecoration(color: Colors.blue),
                    width: 98,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Update User'),
                                    content: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 200.0,
                                      ),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: _nameController,
                                            decoration: InputDecoration(
                                              label:
                                                  Text('${users[index].name}'),
                                            ),
                                          ),
                                          TextField(
                                            controller: _emailController,
                                            decoration: InputDecoration(
                                              label:
                                                  Text('${users[index].email}'),
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                updateUser(
                                                  index,
                                                  _nameController.text.trim(),
                                                  _emailController.text.trim(),
                                                );
                                              });
                                              _nameController.clear();
                                              _emailController.clear();
                                              Get.back();
                                            },
                                            child: const Text('Update'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              deleteUser(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
