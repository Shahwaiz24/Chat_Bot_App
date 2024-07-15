import 'package:firebase_auth/firebase_auth.dart';

import 'package:stacked/stacked.dart';

class GetOtpViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

bool otpCheck({required String verificationId, required String enteredCode}) {
    PhoneAuthCredential credential;
    try {
      credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: enteredCode);
      FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
    
  }
}
