import 'dart:convert';
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
    } on Exception catch (e) {
      print("Execption: ${e.toString()}");
      return [];
    }
  }
}
