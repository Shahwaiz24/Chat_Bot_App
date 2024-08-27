// import 'package:chat_bot/Register%20View/register_view.dart';
import 'package:Atom/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:Atom/Register%20View/register_view.dart';
import 'package:Atom/Services/api_service.dart';
import 'package:Atom/Services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class StartingViewmodel extends BaseViewModel {
  ApiService apiService = ApiService();
  List<String> countryCodeList = [];

  bool isError = false;
  bool isloading = false;
  List<String> CountryCode = [];

  getCode() async {
    try {
      countryCodeList = await apiService.getapi(code: countryCodeList);
      return countryCodeList;
    } on Exception catch (e) {
      // print('Exception: ${e.toString()}');
      return ['Error'];
    }
  }

  getStatustAndCode({required BuildContext context}) async {
    CountryCode.clear();
    isError = false;
    isloading = true;
    rebuildUi();
    CountryCode = await getCode();
    if (CountryCode.contains('Error')) {
      isError = true;
      isloading = false;
      rebuildUi();
    } else {
      bool checkLogin = await LocalStorage.checkLogin();
      if (checkLogin == true) {
        isloading = false;
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: ChatBotView(),
                duration: Duration(seconds: 2)));
        PhoneNumberController.clear();
      } else {
        isloading = false;

        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: RegisterView(
                  CountryCodes: CountryCode,
                ),
                duration: Duration(seconds: 2)));
        PhoneNumberController.clear();
      }
    }
  }

  stateRebuild() {
    rebuildUi();
  }
}
