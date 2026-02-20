import 'package:flutter/material.dart';
import 'package:test_code/multi_json_data/services/api_services.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/category_model.dart';

class DashboardController extends ChangeNotifier {
  DashboardController() {
    loadAll();
  }

  List<Product> _allProducts = [];

  List<Product> products = [];
  List<Order> orders = [];
  List<Category> categories = [];

  bool loading = false;
  String? error;

  /// Fetch all data from API
  Future<void> loadAll() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final data = await DummyApiService.fetchAll();

      _allProducts = data['products'] as List<Product>;
      products = List<Product>.from(_allProducts);
      orders = data['orders'] as List<Order>;
      categories = data['category'] as List<Category>;
    } catch (e) {
      error = e.toString();
      debugPrint("DashboardController.loadAll error: $e");
    }

    loading = false;
    notifyListeners();
  }

  /// Search products by title
  void searchProducts(String query) {
    if (query.isEmpty) {
      products = List<Product>.from(_allProducts);
    } else {
      products = _allProducts
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
