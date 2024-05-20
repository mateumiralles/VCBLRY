import 'package:flutter/material.dart';

SnackBar customSnackBar({text}) {
  return SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.deepPurple[500],
  );
}
