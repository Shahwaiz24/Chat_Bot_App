import 'dart:math';

import 'package:flutter/material.dart';

class DownMenu extends StatefulWidget {
  const DownMenu(
      {super.key,
      required this.countryCodes,
      required this.height,
      required this.width,
      required this.screenHeight,
      required this.screenWidth});
  final List<String> countryCodes;
  final height;
  final width;
  final screenHeight;
  final screenWidth;

  @override
  State<DownMenu> createState() => _DownMenuState();
}

class _DownMenuState extends State<DownMenu> {
  String? _selectedValue;

  List<DropdownMenuItem<String>> get items {
    return widget.countryCodes.map((countryCode) {
      return DropdownMenuItem(
        value: countryCode,
        child: Text(countryCode),
      );
    }).toList();
  }

  void onChanged(String? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: widget.screenWidth * widget.width,
          height: widget.screenHeight * widget.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.030),
          ),
          child: DropdownButton(
            value: _selectedValue,
            items: items,
            onChanged: onChanged,
            style: TextStyle(color: Colors.red),
            dropdownColor: Colors.yellow,
          ),
        );
      },
    );
  }
}
