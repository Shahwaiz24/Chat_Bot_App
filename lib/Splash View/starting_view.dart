// ignore_for_file: unused_local_variable

import 'package:chat_bot/Splash%20View/starting_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<StartingViewmodel>.reactive(
        viewModelBuilder: () => StartingViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              body: Stack(
            children: [
             Positioned.fill(
                child: Image(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),)
            ],
          ));
        });
  }
}
