// ignore_for_file: unused_local_variable

import 'package:chat_bot/Services/utils.dart';
import 'package:chat_bot/Register%20View/register_view.dart';
import 'package:chat_bot/Splash%20View/starting_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class StartingView extends StatelessWidget {
  const StartingView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder<StartingViewmodel>.nonReactive(
      viewModelBuilder: () => StartingViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // This is The Main Column For this Page //
              Center(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center horizontally
                  children: [
                    SizedBox(height: screenHeight * 0.080),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center row horizontally
                      children: [
                        Image(
                          image: AssetImage('assets/images/flashcircle.png'),
                          height: screenHeight * 0.080,
                          width: screenWidth * 0.080,
                        ),
                        SizedBox(width: screenWidth * 0.015),
                        Text(
                          'atom',
                          style: TextStyle(
                            color: Utils.TextColor,
                            fontFamily: 'Comforta-Medium',
                            fontSize: screenHeight * 0.030,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.210),
                    Text(
                      'Unleash the power of Atom',
                      style: TextStyle(
                          color: Utils.TextColor,
                          fontFamily: 'Chivo-Regular',
                          fontSize: screenHeight * 0.024),
                    ),
                    Text(
                      'AI powered bot for your everyday life',
                      style: TextStyle(
                          color: Utils.TextGreyColor,
                          fontSize: screenHeight * 0.016),
                    ),
                    SizedBox(
                      height: screenHeight * 0.240,
                    ),
                    Text(
                      'Tap to start Atom',
                      style: TextStyle(
                          color: Utils.TextGreyColor,
                          fontSize: screenHeight * 0.018),
                    ),
                    // Button Container //
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: const RegisterView(),
                                duration: Duration(seconds: 2)));
                      },
                      child: Container(
                        height: screenHeight * 0.250,
                        width: screenWidth * 0.370,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/animIcon.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.018,
                    ),
                    Text(
                      '©2030 atom. All rights reserved.',
                      style: TextStyle(
                          color: Utils.TextGreyColor.withOpacity(0.7),
                          fontSize: screenHeight * 0.013),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
