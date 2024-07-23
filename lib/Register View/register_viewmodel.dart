import 'package:chat_bot/Register%20View/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future<void> SentingOtp(
      {required String phoneNumber, required String CountryCode}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print(phoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print("exception: ${exception.toString()}");
          isError = true;
        },
        codeSent: (String verificationId, int? token) {
          print('PhoneNumber: $phoneNumber');
          // Set verificationId here
          verfyId = verificationId;
          OTPSent = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be called when auto-retrieval times out
          print('codeAutoRetrievalTimeout: $verificationId');
        },
        phoneNumber: "${CountryCode}${phoneNumber}",
      );
    } on FirebaseAuthException catch (exception) {
      print("FirebaseAuthException: ${exception.toString()}");
      isError = true;
    } catch (e) {
      print("Exception: ${e.toString()}");
      isError = true;
    }
  }
}
