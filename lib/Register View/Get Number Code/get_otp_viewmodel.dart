import 'package:firebase_auth/firebase_auth.dart';

import 'package:stacked/stacked.dart';

class GetOtpViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

Future<bool> otpCheck({required String verificationId, required String enteredCode}) async {
    PhoneAuthCredential credential;
    try {
      credential = await PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: enteredCode);
      FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
    
  }
}
