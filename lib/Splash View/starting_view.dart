// ignore_for_file: unused_local_variable

import 'package:Atom/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:Atom/Services/local_storage.dart';
import 'package:Atom/Services/utils.dart';
import 'package:Atom/Register%20View/register_view.dart';
import 'package:Atom/Splash%20View/starting_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class StartingView extends StatefulWidget {
  const StartingView({super.key});

  @override
  State<StartingView> createState() => _StartingViewState();
}

class _StartingViewState extends State<StartingView> {
  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder<StartingViewmodel>.reactive(
      viewModelBuilder: () => StartingViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
            const Positioned.fill(
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
                    viewModel.isError == true
                        ? SizedBox(
                            height: screenHeight * 0.190,
                          )
                        : SizedBox(
                            height: screenHeight * 0.240,
                          ),
                    viewModel.isError == true
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  size: screenHeight * 0.035,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                                Text(
                                  'Check Your Internet Connection',
                                  style: TextStyle(color: Utils.TextColor),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            'Tap to start Atom',
                            style: TextStyle(
                                color: Utils.TextGreyColor,
                                fontSize: screenHeight * 0.018),
                          ),
                    // Button Container //
                    viewModel.isloading == true
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.030,
                                bottom: screenWidth * 0.030),
                            child: Container(
                                child: CircularProgressIndicator(
                              color: Utils.Purple,
                            )),
                          )
                        : InkWell(
                            onTap: () async {
                            await  viewModel.getStatustAndCode(context: context);
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
