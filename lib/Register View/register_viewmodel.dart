import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future<Map<String, dynamic>> OtpSent(
      {required String phoneNumber, required String CountryCode}) async {
    String? verfyId;
    bool isCodeSent = false;
    print(phoneNumber);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print(phoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print("exception: ${exception.toString()}");
        },
        codeSent: (String verificationId, int? token) {
          print('PhoneNumber: $phoneNumber');
          // Set verificationId here
          verfyId = verificationId;
          isCodeSent = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be called when auto-retrieval times out
          print('codeAutoRetrievalTimeout: $verificationId');
        },
        phoneNumber: "${CountryCode}${phoneNumber}",
      );

      if (isCodeSent && verfyId != null) {
        return <String, dynamic>{'CodeSent': true, 'verificationId': verfyId};
      } else {
        return <String, dynamic>{'CodeSent': false};
      }
    } on Exception catch (e) {
      print("Exception: ${e.toString()}");
      return <String, dynamic>{'CodeSent': false};
    }
  }

}
