import 'package:chat_bot/Splash%20View/starting_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Chivo-Light'),
      debugShowCheckedModeBanner: false,
      home: const StartingView(),
    );
  }
}

