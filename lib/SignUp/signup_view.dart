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
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignupViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Utils.backgroundColor,
            body: Stack(
              children: [
                Positioned.fill(
                    child: Image(
                  image: AssetImage('assets/images/background_2.png'),
                  fit: BoxFit.cover,
                )),
                // This is The Main Column //
                Column(),
              ],
            ),
          );
        });
  }
}
