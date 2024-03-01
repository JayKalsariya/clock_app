import 'package:flutter/material.dart';

Widget timeBox({required int timeFormat}) {
  return Container(
    margin: const EdgeInsets.only(left: 12, right: 20),
    height: 70,
    width: 70,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.blue,
          blurRadius: 3,
          offset: Offset(7, -7),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Text(
      "$timeFormat",
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
