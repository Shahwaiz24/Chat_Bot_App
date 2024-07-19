import 'package:chat_bot/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:chat_bot/Register%20View/register_view.dart';
import 'package:chat_bot/Services/chat_services.dart';
import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/retry.dart';

String selectedCountryCode = '';

class Textfield extends StatefulWidget {
  const Textfield(this.isObsecure,
      {super.key,
      required this.screenHeight,
      required Widget this.surfix,
      required this.isCode,
      required this.Controller,
      required this.isChat,
      required this.screenWidth,
      required this.hintText,
      required this.backColor,
      required this.hintColor,
      required this.countryCodes,
      required this.initialCountryCode});

  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final bool isChat;
  final Widget surfix;

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
  List<DropdownMenuItem<String>> get items {
    return widget.countryCodes.map((countryCode) {
      return DropdownMenuItem(
        value: countryCode,
        child: Text(countryCode),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.initialCountryCode;
  }

  @override
  Widget build(BuildContext context) {
    return widget.isCode == false
        ? TextFormField(
            // onChanged: widget.onChangedFunction,
            controller: widget.Controller,
            keyboardType: widget.isChat == true
                ? TextInputType.text
                : TextInputType.number,
            style: TextStyle(color: widget.hintColor),
            obscureText: widget.isObsecure == true ? true : false,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: widget.isChat == true
                  ? Utils.TextColor
                  : widget.backColor.withOpacity(0.2),
              filled: true,
              contentPadding: EdgeInsets.only(
                  top: widget.screenHeight * 0.060,
                  left: widget.screenWidth * 0.080),
              hintStyle: TextStyle(color: widget.hintColor.withOpacity(0.7)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * 0.115),
                  borderSide: BorderSide(
                      width: 0.8,
                      color: widget.isChat == true
                          ? Utils.Black.withOpacity(0.7)
                          : Utils.TextColor.withOpacity(0.4))),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * 0.115),
                  borderSide: BorderSide(
                      width: 0.8,
                      color: widget.isChat == true
                          ? Utils.Black.withOpacity(0.7)
                          : Utils.TextColor.withOpacity(0.4))),
              suffixIcon: widget.isChat == true
                  ? widget.surfix
                  : Text(''),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(color: Utils.TextColor.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(widget.screenWidth * 0.115),
            ),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: selectedCountryCode,
                      alignment: Alignment.center,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: widget.screenHeight * 0.030,
                      iconEnabledColor: widget.hintColor,
                      elevation: 16,
                      dropdownColor: widget.backColor.withOpacity(0.2),
                      style: TextStyle(
                        color: widget.hintColor,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
                      items: items),
                ),
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
