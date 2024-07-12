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
                child: Image(
                  image: AssetImage('assets/images/background_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      height: screenHeight *
                          0.050), // Add some padding from the top if needed
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.040),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: screenHeight * 0.035,
                      color: Utils.TextColor,
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
