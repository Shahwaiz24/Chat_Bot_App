import 'package:Atom/Services/local_storage.dart';
import 'package:Atom/Verifying%20View/verifying_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:stacked/stacked.dart';

class GetOtpViewmodel extends BaseViewModel {
  bool otpChecking = false;
  bool isOtperror = false;
  stateRebuild() {
    rebuildUi();
  }

  otpCheck(
      {required String otp,
      required String enteredCode,
      required BuildContext context}) async {
    otpChecking = true;
    isOtperror = false;
    rebuildUi();
    if (otp == enteredCode) {
      otpChecking = false;
      await LocalStorage.loginSave();
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const VerifyingView(),
              duration: const Duration(milliseconds: 1000)));
    } else {
      otpChecking = false;
      isOtperror = true;
      rebuildUi();
      await Future.delayed(const Duration(milliseconds: 2000));
      isOtperror = true;
      rebuildUi();
    }
  }
}
