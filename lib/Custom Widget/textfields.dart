import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield(this.isObsecure,
      {super.key,
      required this.screenHeight,
      required this.Controller,
      required this.onChangedFunction,
      required this.screenWidth,
      required this.hintText,
      required this.backColor,
      required this.hintColor});

  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final onChangedFunction;
  final Color hintColor;
  final Color backColor;
  final bool isObsecure;
  final TextEditingController Controller;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: widget.onChangedFunction,
      controller: widget.Controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: widget.hintColor),
      obscureText: widget.isObsecure == true ? true : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: widget.backColor.withOpacity(0.2),
        filled: true,
        contentPadding: EdgeInsets.only(
            top: widget.screenHeight * 0.060, left: widget.screenWidth * 0.080),
        hintStyle: TextStyle(color: widget.hintColor.withOpacity(0.6)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.115),
            borderSide: BorderSide(
                width: 0.8, color: Utils.TextColor.withOpacity(0.4))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.115),
            borderSide: BorderSide(
                width: 0.8, color: Utils.TextColor.withOpacity(0.4))),
      ),
    );
  }
}
