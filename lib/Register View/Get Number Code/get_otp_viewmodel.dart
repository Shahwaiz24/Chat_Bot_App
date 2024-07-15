import 'package:chat_bot/Services/otp_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:stacked/stacked.dart';

class GetOtpViewmodel extends BaseViewModel {
  bool otpCheck({required verificationId, required enteredCode}) {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: enteredCode);
      FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return false;
    }
    return true;
  }
}
