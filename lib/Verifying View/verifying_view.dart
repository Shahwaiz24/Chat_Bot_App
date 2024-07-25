import 'package:Atom/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:Atom/Services/local_storage.dart';
import 'package:Atom/Services/utils.dart';
import 'package:Atom/Verifying%20View/verifying_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class VerifyingView extends StatefulWidget {
  const VerifyingView({super.key});

  @override
  State<VerifyingView> createState() => _VerifyingViewState();
}

class _VerifyingViewState extends State<VerifyingView> {
  @override
  Widget build(BuildContext context) {
    // Get Size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VerifyingViewmodel(),
        onViewModelReady: (viewmodel) {
          viewmodel.verification();
        },
        builder: (context, viewModel, child) {
          if (viewModel.loading == 100) {
            // Delay the navigation until the build phase is complete
            Future.delayed(Duration(seconds: 2), () {
             
              Navigator.pushReplacement(
                context,
                PageTransition(
                  child: ChatBotView(),
                  duration: Duration(seconds: 2),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            });
          }
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/background_Elipse.png')),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/animIcon.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.030,
                        ),
                        Text(viewModel.loadingLevel,
                            style: TextStyle(
                                color: Utils.VerificationColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                                fontSize: screenHeight * 0.020)),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Text(
                          '${viewModel.loading.toString()}%',
                          style: TextStyle(
                              color: Utils.TextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.020),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
