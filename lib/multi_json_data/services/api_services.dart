import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_code/fetch_api/core/constants/endpoints.dart';

import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/category_model.dart';

class DummyApiService {
  static const baseUrl = "https://dummyjson.com";

  static Future<Map<String, dynamic>> fetchAll() async {
    // ⚡ Parallel API calls (FAST)
    final responses = await Future.wait([
      http
          .get(Uri.parse("${Endpoints.baseUrl}/products"))
          .timeout(const Duration(seconds: 10)),
      http.get(Uri.parse("${Endpoints.baseUrl}/carts")),
      http.get(Uri.parse("${Endpoints.baseUrl}/products/categories")),
    ]);

    // Check for status code errors
    for (final res in responses) {
      if (res.statusCode != 200) {
        throw Exception("Failed to load data: ${res.statusCode}");
      }
    }

    final productsData = jsonDecode(responses[0].body);
    final ordersData = jsonDecode(responses[1].body);
    final categoriesData = jsonDecode(responses[2].body);

    return {
      "products": (productsData['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),

      "orders": (ordersData['carts'] as List)
          .map((e) => Order.fromJson(e))
          .toList(),

      "category": (categoriesData as List)
          .map((e) => Category.fromJson(e))
          .toList(),
    };
  }
}
