import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.text,
      required this.ontap});

  final double screenHeight;
  final String text;
  final  ontap;
  final double screenWidth;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: widget.screenHeight * 0.080,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Utils.WhiteButton.withOpacity(1.0), Utils.Black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(widget.screenWidth * 0.090),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: Utils.TextColor, fontSize: widget.screenHeight * 0.020),
        )),
      ),
    );
  }
}
