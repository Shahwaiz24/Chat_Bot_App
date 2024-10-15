import 'dart:convert';
import 'dart:developer';

import 'package:Atom/Register%20View/Get%20Number%20Code/get_otp_view.dart';
import 'package:Atom/Register%20View/register_view.dart';
import 'package:Atom/Services/api_service.dart';
import 'package:Atom/Services/global_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterViewmodel extends BaseViewModel {
  bool isSentOtp = false;
  bool isError = false;
  bool OTPSent = false;
  stateRebuild() {
    rebuildUi();
  }

  sentingOtp(
      {required String phoneNumber,
      required String CountryCode,
      required BuildContext context}) async {
    try {
      print(CountryCode + phoneNumber);
      isSentOtp = true;
      rebuildUi();
      final Map map = {"number": "${CountryCode}${phoneNumber}"};
      var json1 = jsonEncode(map);
      bool api = await ApiService.sendCode(body: json1);
      if (api == true) {
        isSentOtp = false;
        OTPSent = false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    GetOtpView(verificationId: GlobalData.otp)));
      } else {
        isSentOtp = false;
        OTPSent = false;
        isError = true;
        rebuildUi();
        await Future.delayed(const Duration(milliseconds: 2000));
        isError = false;
        rebuildUi();
      }
    } catch (e) {
      print("Error : ${e.toString()}");
      isSentOtp = false;
      OTPSent = false;
      isError = true;
      rebuildUi();
      await Future.delayed(const Duration(milliseconds: 2000));
      isError = false;
      rebuildUi();
    }
  }
}
