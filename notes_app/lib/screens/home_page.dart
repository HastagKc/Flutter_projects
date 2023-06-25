import 'package:flutter/material.dart';
import 'package:notes_app/common_widgets/custom_elevetedbtn.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/screens/details_page.dart';
import 'package:notes_app/screens/drop_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController noteTitleController = TextEditingController();

  final TextEditingController noteDiscribtionController =
      TextEditingController();

  final List<String> btnList = [
    'Notes',
    'Highlights',
    'Favorite Notes',
  ];

  final List<Color> colors = [
    const Color.fromARGB(255, 236, 136, 129),
    const Color.fromARGB(255, 120, 194, 122),
    const Color.fromARGB(255, 154, 197, 142),
    // const Color.fromARGB(255, 119, 183, 194),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Loo Note',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notification_add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            showDialogWidget(context: context);
          });
        },
        child: const Icon(
          Icons.add,
          size: 40.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14.0),
              width: MediaQuery.of(context).size.width,
              height: 80,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 209, 203, 203),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: CustomElevatedBtn(
                btnList: btnList,
              ),
            ),
            const SizedBox(height: 30.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('List Notes'),
                DropPage(),
              ],
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                itemCount: note.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      /*   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(note: note[index]);
                          },
                        ),
                      ); */
                      Get.to(
                        DetailsPage(note: note[index]),
                        transition: Transition.fade,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: colors[index],
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            height: 150,
                            child: Text(
                              note[index].content,
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    note[index].category,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  height: 20,
                                  width: 120,
                                  child: Text(
                                    note[index].catTitle,
                                  ),
                                ),
                              ]),
                              Expanded(
                                child: Text(
                                  note[index].getFormattedDateTime(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Future<void> showDialogWidget({
    required BuildContext context,
  }) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Notes'),
            content: Container(
              height: 200,
              width: 200,
              child: Column(
                children: [
                  TextField(
                    controller: noteTitleController,
                    decoration: const InputDecoration(
                      label: Text('Enter Note title'),
                    ),
                  ),
                  TextField(
                    controller: noteDiscribtionController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Enter text...',
                    ),
                    // scrollController: ScrollController(),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Save'),
              ),
            ],
          );
        });
  }

  void addUser() {
    void addUser() {
      String noteTitle = noteTitleController.text.trim();
      String noteDis = noteDiscribtionController.text.trim();

      if (noteTitle.isNotEmpty && noteDis.isNotEmpty) {
        note.add(
          NotesModel(
            title: noteTitle,
            content: noteDis,
            category: 'lifestyle',
            catTitle: 'Basic',
            dateTime: DateTime.now(),
          ),
        );
      }
    }
  }
}
