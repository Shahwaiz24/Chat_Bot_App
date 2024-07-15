import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  OtpSent(
      {required String PhoneNumber, required context, required view}) async {
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
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop, child: view()));
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
