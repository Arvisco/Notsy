import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/writer.dart';
import 'package:todolist/index.dart';

class Routers extends StatefulWidget {
  const Routers({super.key});

  @override
  State<Routers> createState() => _RoutersState();
}

class _RoutersState extends State<Routers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Index(),
        '/writer': (context) => Writer(),
      },
      theme: ThemeData(
          useMaterial3: true,
          // Define the default brightness and colors.
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color.fromARGB(255, 26, 26, 26),
              onPrimary: Colors.white,
              secondary: Color.fromARGB(255, 255, 230, 0),
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.black,
              background: Color.fromARGB(255, 26, 26, 26),
              onBackground: Colors.black,
              surface: Colors.black,
              onSurface: Colors.white)),
      debugShowCheckedModeBanner: false,
    );
  }
}
