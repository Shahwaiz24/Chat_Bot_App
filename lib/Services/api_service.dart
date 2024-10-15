import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:Atom/Services/global_data.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String url = 'https://restcountries.com/v3.1/all';

  static final String otpUrl =
      "https://chat-bot-theta-nine.vercel.app/v1/api/send-otp";

  static sendCode({required body}) async {
    try {
      var parsedUrl = Uri.parse(ApiService.otpUrl);

      var response = await http.post(parsedUrl, body: body, headers: {
        "Content-Type": "application/json",
      });

      var responseBody = jsonDecode(response.body);
      if (responseBody['Status'] == "Success") {
        print("Body : ${responseBody}");
        GlobalData.otp = responseBody['OTP'];
        return true;
      } else {
        print("Body : ${responseBody}");

        return false;
      }
    } catch (e) {
      print("Body : ${e.toString()}");
      return false;
    }
  }

  Future<List<String>> getapi({required List<String> code}) async {
    try {
      var parsedUrl = Uri.parse(ApiService.url);
      var response = await http.get(parsedUrl);

      final List body = jsonDecode(response.body);

      for (var i = 0; i < body.length; i++) {
        if (body[i]['idd'] != null &&
            body[i]['idd']['root'] != null &&
            body[i]['idd']['suffixes'] != null &&
            body[i]['idd']['suffixes'][0] != null) {
          String root = body[i]['idd']['root'].toString();
          String suffix = body[i]['idd']['suffixes'][0].toString();
          String countryCode = '${root}${suffix}';
          code.add(countryCode);
        }
      }

      // Sort the list in ascending order
      code.sort((a, b) => a.compareTo(b));

      return code;
    } on SocketException catch (e) {
      print('No internet connection: ${e.toString()}');
      return ['Error']; // Return a list with a single element 'Error'
    } on TimeoutException catch (e) {
      print('Timeout error: ${e.toString()}');
      return ['Error']; // Return a list with a single element 'Error'
    } catch (e) {
      print('Unknown error: ${e.toString()}');
      return ['Error']; // Return a list with a single element 'Error'
    }
  }
}
