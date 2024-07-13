import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.hintText,
      required this.backColor,
      required this.hintColor});

  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final Color hintColor;
  final Color backColor;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter your phone Number',
        fillColor: widget.backColor.withOpacity(0.2),
        filled: true,
        contentPadding: EdgeInsets.only(
            top: widget.screenHeight * 0.060, left: widget.screenWidth * 0.080),
        hintStyle: TextStyle(color: widget.hintColor.withOpacity(0.6)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.115),
            borderSide: BorderSide(
                width: 0.8, color: Utils.TextColor.withOpacity(0.4))),
      ),
    );
  }
}
