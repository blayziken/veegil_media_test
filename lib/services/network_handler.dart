import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseURL = 'https://bank.veegil.com';

  Future get(String url) async {
    var callUrl = Uri.parse('$baseURL/$url');

    var response = await http.get(callUrl);
    return json.decode(response.body);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    var callUrl = Uri.parse('$baseURL/$url');

    var response = await http.post(callUrl, body: json.encode(body));
    return (response);
  }
}
