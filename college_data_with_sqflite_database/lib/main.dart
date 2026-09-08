import 'package:flutter/material.dart';
import 'models/college_model.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Data',
      initialRoute: '/',
      routes: {
        '/': (context) => CollegeList(),
      },
    );
  }
}

