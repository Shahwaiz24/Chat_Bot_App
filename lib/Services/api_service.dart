import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static final String url = 'https://restcountries.com/v3.1/all';

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
