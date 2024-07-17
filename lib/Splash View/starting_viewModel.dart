import 'package:chat_bot/Services/api_service.dart';
import 'package:stacked/stacked.dart';

class StartingViewmodel extends BaseViewModel {
  ApiService apiService = ApiService();
  List<String> countryCodeList = [];

  

  getCode() async {
    try {
      countryCodeList = await apiService.getapi(code: countryCodeList);
      return countryCodeList;
    } on Exception catch (e) {
      print('Execption: ${e.toString()}');
      // TODO
    }
  }
}
