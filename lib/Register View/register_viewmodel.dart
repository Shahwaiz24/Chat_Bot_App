import 'package:chat_bot/Register%20View/Get%20Number%20Code/get_otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future OtpSent({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    bool isCodeSent = false;
    String? Verificationid;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print(phoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.toString());
        },
        codeSent: (String verificationId, int? token) {
          print('PhoneNumber: $phoneNumber');

          isCodeSent = true;
          Verificationid = verificationId; // Set isCodeSent to true
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phoneNumber,
      );
    } on Exception catch (e) {
      print("Exception: ${e.toString()}");
    }

    if (isCodeSent == true && Verificationid != null) {
      Map verificationCheck = {
        'CodeSent': isCodeSent,
        'verificationId': Verificationid
      };
      return verificationCheck;
    } else {
      return isCodeSent;
    }

    // Return the value of isCodeSent
  }
}
