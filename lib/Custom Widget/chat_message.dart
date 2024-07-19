import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
   ChatMessage({super.key, required this.userChat});

  bool userChat;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(),
    );
  }
}
