import 'package:Atom/Services/chat_services.dart';
import 'package:Atom/Services/utils.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class ChatMessage extends StatefulWidget {
  ChatMessage({super.key, this.userChat = false, required this.chatData});

  bool userChat;
  ChatModel chatData;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.userChat ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.2,
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: widget.userChat == false
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                topRight: widget.userChat
                    ? const Radius.circular(0)
                    : const Radius.circular(10),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
              ),
              color: widget.userChat == true
                  ? Color.fromARGB(255, 226, 230, 243)
                  : Colors.grey.withOpacity(0.7),
            ),
            child: widget.userChat == true
                ? Text(
                    widget.chatData.chatContent,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.030),
                    child: TypeWriter.text(
                      style: TextStyle(
                        color: Utils.Black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      widget.chatData.chatContent,
                      duration: const Duration(milliseconds: 50),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
