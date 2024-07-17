import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  stateRebuild() {
    rebuildUi();
  }

  Future<Map<String, dynamic>> OtpSent({
    required String phoneNumber,
  }) async {
    String? verfyId;
    print(phoneNumber);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          print(phoneAuthCredential.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          print("exception:    ${exception.toString()}");
        },
        codeSent: (String verificationId, int? token) {
          print('PhoneNumber: $phoneNumber');
          // Set verificationId here
          verfyId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: "+92${phoneNumber}",
      );

     

      if (verfyId != null) {
        return <String, dynamic>{
          // Use <String, dynamic> instead of {}
          'CodeSent': true,
          'verificationId': verfyId
        };
      } else {
        return <String, dynamic>{'CodeSent': false};
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
