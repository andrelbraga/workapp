import 'package:flutter/material.dart';

Widget InputButton(BuildContext context, dynamic personObj, Function handle) {

  final ButtonStyle style = ElevatedButton.styleFrom(
      fixedSize: const Size(220, 50), textStyle: const TextStyle(fontSize: 20));
  return ElevatedButton(
    style: style,
    child: const Text("Submit"),
    onPressed: () {
      handle();
    },
  );
}