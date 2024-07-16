import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future<Map<String, dynamic>> OtpSent({
    required String phoneNumber,
  }) async {
    String? verificationId;
    print(phoneNumber);

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
          // Set verificationId here
          verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: "+92 ${phoneNumber}",
      );

      // Wait for the codeSent callback to complete
      await Future.delayed(Duration(seconds: 2)); // adjust the delay as needed

      if (verificationId != null) {
        return <String, dynamic>{
          // Use <String, dynamic> instead of {}
          'CodeSent': true,
          'verificationId': verificationId
        };
      } else {
        return <String, dynamic>{
          // Use <String, dynamic> instead of {}
          'CodeSent': false
        };
      }
    } on Exception catch (e) {
      print("Exception: ${e.toString()}");
      return <String, dynamic>{
        // Use <String, dynamic> instead of {}
        'CodeSent': false
      };
    }
  }
}
