import 'package:flutter/material.dart';

AppBar header(String title) {
// Widget build(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 35, fontWeight: FontWeight.w900, fontFamily: 'Header'),
        ),
      ],
    ),
  );
  //
}
