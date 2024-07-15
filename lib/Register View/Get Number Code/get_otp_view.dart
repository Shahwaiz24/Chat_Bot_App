import 'package:chat_bot/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:chat_bot/Custom%20Widget/button.dart';
import 'package:chat_bot/Custom%20Widget/textfields.dart';
import 'package:chat_bot/Register%20View/Get%20Number%20Code/get_otp_viewmodel.dart';
import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

bool otpChecking = false;
bool isOtperror = false;

class GetOtpView extends StatefulWidget {
  const GetOtpView({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<GetOtpView> createState() => _GetOtpViewState();
}

TextEditingController OtpController = TextEditingController();

class _GetOtpViewState extends State<GetOtpView> {
  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => GetOtpViewmodel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Utils.backgroundColor,
            body: otpChecking == true
                ? Stack(
                    children: [
                      Container(
                        height: screenHeight,
                        width: screenWidth,
                        child: const Image(
                          image: AssetImage('assets/images/background_2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: Utils.Purple,
                        ),
                      )
                    ],
                  )
                : Stack(
                    children: [
                      Container(
                        height: screenHeight,
                        width: screenWidth,
                        child: const Image(
                          image: AssetImage('assets/images/background_2.png'),
                          fit: BoxFit.cover,
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
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.120,
                              ),
                              Text(
                                'Verification Code Recieved',
                                style: TextStyle(
                                    color: Utils.TextColor,
                                    fontSize: screenHeight * 0.020),
                              ),
                              SizedBox(
                                height: screenHeight * 0.100,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.070,
                                      right: screenWidth * 0.070),
                                  child: Textfield(
                                    true,
                                    backColor: Utils.Purple,
                                    Controller: OtpController,
                                    hintColor: Utils.TextColor,
                                    hintText: 'Verification Code',
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                  )),
                              isOtperror == true
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.010,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: screenWidth * 0.030),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.error_outline_rounded,
                                                size: screenHeight * 0.020,
                                                color: Colors.red,
                                              ),
                                              SizedBox(
                                                width: screenWidth * 0.010,
                                              ),
                                              Text('Enter a valid Number',
                                                  style: TextStyle(
                                                      color: Utils.TextColor,
                                                      fontSize: screenHeight *
                                                          0.023)),
                                            ],
                                          ),
                                        ),
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
                                  text: 'Verify',
                                  ontap: () async {
                                    otpChecking = true;
                                    viewmodel.stateRebuild();
                                    bool otpCheck = await viewmodel.otpCheck(
                                        verificationId: widget.verificationId,
                                        enteredCode: OtpController.text);
                                    if (otpCheck == true) {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              child: ChatBotView(),
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              duration: Duration(seconds: 2)));
                                    } else {
                                      isOtperror = true;
                                      viewmodel.stateRebuild();
                                    }

                                    OtpController.clear();
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
        });
  }
}
