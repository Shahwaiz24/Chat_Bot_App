import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield(this.isObsecure,
      {super.key,
      required this.screenHeight,
      required this.isCode,
      required this.Controller,
      required this.onChangedFunction,
      required this.screenWidth,
      required this.hintText,
      required this.backColor,
      required this.hintColor,
      required this.countryCodes,
      required this.initialCountryCode});

  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final onChangedFunction;
  final Color hintColor;
  final bool isCode;
  final Color backColor;
  final bool isObsecure;
  final TextEditingController Controller;
  final List<String> countryCodes;
  final String initialCountryCode;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  String _selectedCountryCode = '';

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = widget.initialCountryCode;
  }

  @override
  Widget build(BuildContext context) {
    return widget.isCode == false
        ? TextFormField(
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
                  top: widget.screenHeight * 0.060,
                  left: widget.screenWidth * 0.080),
              hintStyle: TextStyle(color: widget.hintColor.withOpacity(0.6)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * 0.115),
                  borderSide: BorderSide(
                      width: 0.8, color: Utils.TextColor.withOpacity(0.4))),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * 0.115),
                  borderSide: BorderSide(
                      width: 0.8, color: Utils.TextColor.withOpacity(0.4))),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(color: Utils.TextColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(widget.screenWidth * 0.115),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                          top: widget.screenHeight * 0.060,
                          left: widget.screenWidth * 0.080),
                      hintStyle:
                          TextStyle(color: widget.hintColor.withOpacity(0.6)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.screenWidth * 0.115),
                          borderSide: BorderSide(
                              width: 0.8,
                              color: Utils.TextColor.withOpacity(0.4))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.screenWidth * 0.115),
                          borderSide: BorderSide(
                              width: 0.8,
                              color: Utils.TextColor.withOpacity(0.4))),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
