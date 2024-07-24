import 'dart:developer';

import 'package:chat_bot/Register%20View/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future<bool> SentingOtp(
      {required String phoneNumber, required String CountryCode}) async {
    bool isCodeSented = false;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print(phoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print("exception: ${exception.toString()}");
          // isError = true;
        },
        codeSent: (String verificationId, int? token) {
          log('PhoneNumber: $phoneNumber');
          // Set verificationId here
          verfyId = verificationId;
          isCodeSented = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback will be called when auto-retrieval times out
          print('codeAutoRetrievalTimeout: $verificationId');
        },
        phoneNumber: "${CountryCode}${phoneNumber}",
      );
      if (isCodeSented == true) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (exception) {
      print("FirebaseAuthException: ${exception.toString()}");
      return false;
    } catch (e) {
      print("Exception: ${e.toString()}");
      return false;
    }
  }


}
