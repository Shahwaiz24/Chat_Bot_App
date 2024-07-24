import 'dart:developer';

import 'package:Atom/Custom%20Widget/button.dart';
import 'package:Atom/Custom%20Widget/textfields.dart';
import 'package:Atom/Register%20View/Get%20Number%20Code/get_otp_view.dart';
import 'package:Atom/Services/utils.dart';
import 'package:Atom/Register%20View/register_viewmodel.dart';
import 'package:Atom/Splash%20View/starting_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

bool isSentOtp = false;
bool OTPSent = false;
String? verfyId;

bool isError = false;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.CountryCodes});

  final List<String> CountryCodes;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

TextEditingController PhoneNumberController = TextEditingController();

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.045),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth * 0.05),
                    InkWell(
                      onTap: () {
                        isError = false;
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: screenHeight * 0.040,
                        color: Utils.TextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                  child: isSentOtp == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Utils.Purple,
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.120,
                            ),
                            Text(
                              'Add your Phone number',
                              style: TextStyle(
                                  color: Utils.TextColor,
                                  fontSize: screenHeight * 0.020),
                            ),
                            SizedBox(
                              height: screenHeight * 0.100,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.050,
                                  right: screenWidth * 0.070),
                              child: Textfield(
                                false,
                                isCode: true,
                                isChat: false,
                                surfix: Text(''),
                                initialCountryCode: CountryCode[1],
                                countryCodes: CountryCode,
                                backColor: Utils.Purple,
                                Controller: PhoneNumberController,
                                hintColor: Utils.TextColor,
                                hintText: 'Enter your phone number',
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                            ),
                            isError == true
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.010,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth * 0.070),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.error_outline_rounded,
                                              size: screenHeight * 0.030,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.010,
                                            ),
                                            Text('Enter a valid Number',
                                                style: TextStyle(
                                                    color: Utils.TextColor,
                                                    fontSize:
                                                        screenHeight * 0.020)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.020,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: screenHeight * 0.040,
                                  ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.180,
                                  right: screenWidth * 0.180),
                              child: Button(
                                text: 'Send Code',
                                ontap: () async {

                                  // Ignore This Code please Because WhenEver i write an OTP sending Function in ViewModel its always Return false and return error

                                  
                                  isSentOtp = true;
                                  isError = false;
                                  viewModel.stateRebuild();
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    verificationCompleted: (PhoneAuthCredential
                                        phoneAuthCredential) {
                                      print(phoneAuthCredential.toString());
                                    },
                                    verificationFailed:
                                        (FirebaseAuthException exception) {
                                      print(
                                          "exception: ${exception.toString()}");
                                      isError = true;
                                      viewModel.stateRebuild();
                                    },
                                    codeSent:
                                        (String verificationId, int? token) {
                                      log('PhoneNumber: ${PhoneNumberController.text}');
                                      // Set verificationId here
                                      verfyId = verificationId;
                                      Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          child: GetOtpView(
                                              verificationId: verificationId),
                                          type: PageTransitionType.bottomToTop,
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                      PhoneNumberController.clear();
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {
                                      // This callback will be called when auto-retrieval times out
                                      print(
                                          'codeAutoRetrievalTimeout: $verificationId');
                                    },
                                    phoneNumber:
                                        "${selectedCountryCode}${PhoneNumberController.text}",
                                  );

                                 
                                },
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                            )
                          ],
                        ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.400,
                left: screenWidth * 0.355,
                child: Container(
                  height: screenHeight * 0.220,
                  width: screenWidth * 0.260,
                  child: const Image(
                    image: AssetImage('assets/images/animIcon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
