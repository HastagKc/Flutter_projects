import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/model/notes_model.dart';

class DetailsPage extends StatelessWidget {
  final NotesModel note;
  const DetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);

            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          note.catTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Text(
                        note.catTitle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: const BoxDecoration(
                          /*    border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ), */
                          ),
                      child: Text(
                        note.category,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Label',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(60.0),
                /*   thumbVisibility: true,
                trackVisibility: true, */
                thickness: 6.0,
                child: SingleChildScrollView(
                  child: Text(
                    note.content,
                    textAlign: TextAlign.justify,
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
