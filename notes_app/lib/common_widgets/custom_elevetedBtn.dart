import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatefulWidget {
  final List<String> btnList;

 const  CustomElevatedBtn({Key? key, required this.btnList}) : super(key: key);

  @override
  State<CustomElevatedBtn> createState() => _CustomElevatedBtnState();
}

class _CustomElevatedBtnState extends State<CustomElevatedBtn> {
  late List<bool> isClickedList;

  @override
  void initState() {
    super.initState();
    isClickedList = List.generate(widget.btnList.length, (index) => false);
  }

  void updateClickedState(int index) {
    setState(() {
      for (int i = 0; i < isClickedList.length; i++) {
        isClickedList[0] == true;
        if (i == index) {
          isClickedList[i] = true;
        } else {
          isClickedList[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.btnList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ElevatedButton(
            onPressed: () {
              updateClickedState(index);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: isClickedList[index]
                  ? Colors.red
                  : const Color.fromARGB(255, 209, 203, 203),
              minimumSize: const Size(100, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                /*   side: const BorderSide(
                  color: Colors.black,
                ), */
              ),
            ),
            child: Text(
              widget.btnList[index],
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
