import 'package:flutter/material.dart';
import 'package:listview_search_app/model/programmers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Programmers> programmerList = [
    Programmers(
      proName: 'Larry Page',
      proDetails: '	Lawrence Edward PageMarch 26, 1973 (age 50)',
    ),
    Programmers(
      proName: 'Bill Gates',
      proDetails:
          'William Henry Gates IIIOctober 28, 1955 (age 67)Seattle, Washington, U.S.',
    ),
    Programmers(
      proName: 'Mark Zuckerberg',
      proDetails: 'Mark Elliot ZuckerbergMay 14, 1984 (age 39)',
    ),
    Programmers(
      proName: 'Ken Thompson',
      proDetails: '	Kenneth Lane ThompsonFebruary 4, 1943 (age 80)',
    ),
    Programmers(
      proName: 'Linus Torvalds',
      proDetails: '	Linus Benedict Torvalds28 December 1969 (age 53)',
    ),
    Programmers(
      proName: 'The Countess of Lovelace',
      proDetails:
          '	The Hon. Augusta Ada Byron 10 December 1815 London, England',
    ),
    Programmers(
      proName: 'Larry Page',
      proDetails: '	Lawrence Edward PageMarch 26, 1973 (age 50)',
    ),
    Programmers(
      proName: 'Bill Gates',
      proDetails:
          'William Henry Gates IIIOctober 28, 1955 (age 67)Seattle, Washington, U.S.',
    ),
    Programmers(
      proName: 'Mark Zuckerberg',
      proDetails: 'Mark Elliot ZuckerbergMay 14, 1984 (age 39)',
    ),
    Programmers(
      proName: 'Ken Thompson',
      proDetails: '	Kenneth Lane ThompsonFebruary 4, 1943 (age 80)',
    ),
    Programmers(
      proName: 'Linus Torvalds',
      proDetails: '	Linus Benedict Torvalds28 December 1969 (age 53)',
    ),
    Programmers(
      proName: 'The Countess of Lovelace',
      proDetails:
          '	The Hon. Augusta Ada Byron 10 December 1815 London, England',
    ),
    Programmers(
      proName: 'Larry Page',
      proDetails: '	Lawrence Edward PageMarch 26, 1973 (age 50)',
    ),
    Programmers(
      proName: 'Bill Gates',
      proDetails:
          'William Henry Gates IIIOctober 28, 1955 (age 67)Seattle, Washington, U.S.',
    ),
    Programmers(
      proName: 'Mark Zuckerberg',
      proDetails: 'Mark Elliot ZuckerbergMay 14, 1984 (age 39)',
    ),
    Programmers(
      proName: 'Ken Thompson',
      proDetails: '	Kenneth Lane ThompsonFebruary 4, 1943 (age 80)',
    ),
    Programmers(
      proName: 'Linus Torvalds',
      proDetails: '	Linus Benedict Torvalds28 December 1969 (age 53)',
    ),
    Programmers(
      proName: 'The Countess of Lovelace',
      proDetails:
          '	The Hon. Augusta Ada Byron 10 December 1815 London, England',
    ),
  ];

  // creating Variable

  TextEditingController searchController = TextEditingController();

  // creating empty list

  List<Programmers> filterList = [];

  @override
  void initState() {
    super.initState();

    filterList = programmerList;
  }

  void filterListFun(String keybordValue) {
    setState(() {
      if (keybordValue.isEmpty) {
        filterList = programmerList;
      } else {
        filterList = programmerList
            .where((pro) =>
                pro.proName.toLowerCase().contains(keybordValue.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programmers'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => filterListFun(searchController.text),
              decoration: const InputDecoration(
                label: Text('Search Programmer'),
                suffixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (BuildContext context, int index) {
                final programmer = filterList[index];
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: customText(
                        text: programmer.proName,
                        fontSize: 18.0,
                        isBold: true,
                      ),
                      subtitle: customText(
                        text: programmer.proDetails,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget customText({
    required String text,
    required double fontSize,
    bool isBold = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
