import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future OtpSent({
    required String phoneNumber,
    
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
