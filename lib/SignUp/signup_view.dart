import 'package:chat_bot/Services/utils.dart';
import 'package:chat_bot/SignUp/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Utils.backgroundColor,
          body: Stack(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                child: const Image(
                  image: AssetImage('assets/images/background_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: screenHeight * 0.050),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Icon(
                        Icons.arrow_back_outlined,
                        size: screenHeight * 0.035,
                        color: Utils.TextColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(
                        0), // or any other radius you want
                    child: Stack(
                      
                      children: [
                        // Your gradient container
                        Container(
                          height: screenHeight * 0.500,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(screenWidth * 0.32),
                              topRight: Radius.circular(screenWidth * 0.32),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Utils.Purple.withOpacity(0.4),
                                Utils.Pink.withOpacity(0.4)
                              ],
                            ),
                          ),
                        ),
                        // Your positioned image
                        Positioned(
                          top: -screenHeight * 0.040,
                          child: Container(
                            height: screenHeight * 0.070,
                            width: screenWidth * 0.250,
                            child: Image(
                              image: AssetImage('assets/images/animIcon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
