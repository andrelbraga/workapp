import 'package:flutter/material.dart';

Widget InputField(TextEditingController ctrls, String label) {
  return TextFormField(
    controller: ctrls,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    decoration:
        InputDecoration(border: const OutlineInputBorder(), labelText: label),
  );
}