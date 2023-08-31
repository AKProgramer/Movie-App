import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'apiConstants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}