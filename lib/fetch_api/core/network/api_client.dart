import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/endpoints.dart';

class ApiClient {
  Future<Map<String, dynamic>> get(String path) async {
    final url = Uri.parse("${Endpoints.baseUrl}$path");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error: ${response.statusCode}");
    }
  }
}
