import 'dart:js_util';

import 'package:curd_operation/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating variables
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // creating empty list
  List<Contact> contacts = [
    Contact(name: 'John Doe', email: 'johndoe@example.com'),
    Contact(name: 'Jane Smith', email: 'janesmith@example.com'),
  ];

  // creating methods

  //1 adding user method

  void addUser() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      contacts.add(Contact(name: name, email: email));
      nameController.clear();
      emailController.clear();
    }
  }

  void deleteUser(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  content: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 200.0,
                      maxWidth: 200.0,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            label: Text('Name'),
                            // hintText: 'Name',
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                          ),
                        ),
                        const SizedBox(height: 30),
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
                              child: const Text("Save"),
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
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(contacts[index].name.toString()),
                Text(contacts[index].email.toString()),
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
                      onPressed: () => deleteUser(index),
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
