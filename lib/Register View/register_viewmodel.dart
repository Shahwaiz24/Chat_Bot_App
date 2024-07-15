import 'package:chat_bot/Register%20View/Get%20Number%20Code/get_otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  OtpSent(
      {required String PhoneNumber, required context}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential PhoneAuthCredential) {
          print(PhoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.toString());
        },
        codeSent: (String verificationid, int? token) {
          print('PhoneNumber: ${PhoneNumber}');
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: GetOtpView(verificationId: verificationid,),
                  type: PageTransitionType.bottomToTop,
                  duration: Duration(seconds: 2)));
        },
        codeAutoRetrievalTimeout: (String verificationid) {},
        phoneNumber: PhoneNumber,
      );
    } on Exception catch (e) {
      print("Execption: ${e.toString()}");
      return false;
    }
    
  }
}
