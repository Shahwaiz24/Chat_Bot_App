import 'package:chat_bot/Splash View/starting_view.dart';
import 'package:chat_bot/Verifying%20View/verifying_view.dart';
import 'package:chat_bot/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const VerifyingView(),
    );
  }
}
