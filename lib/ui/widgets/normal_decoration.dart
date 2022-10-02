import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    IconData icons, String hintText, String title) {
  return InputDecoration(
    hintText: hintText,
    labelText: title,
    isDense: true,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}

