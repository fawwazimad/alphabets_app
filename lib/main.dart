
import 'package:alphabets_app/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlphabetsApp());
}

class AlphabetsApp extends StatelessWidget {
  const AlphabetsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}
