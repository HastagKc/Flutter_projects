import 'package:flutter/material.dart';

class CustomWidgets {
  //! Custom CircularAvtar

//? custom Text
  Widget costumText({
    required String textTitle,
    required double fontSize,
    required bool isBold,
    Color color = Colors.black,
  }) {
    return Text(
      textTitle,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
