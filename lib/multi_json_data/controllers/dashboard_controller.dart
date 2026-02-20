import 'package:flutter/material.dart';
import 'package:test_code/multi_json_data/services/api_services.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
import '../models/category_model.dart';

class DashboardController extends ChangeNotifier {
  DashboardController() {
    loadAll();
  }

  List<Product> products = [];
  List<Order> orders = [];
  List<Category> categories = [];

  bool loading = false;

  Future<void> loadAll() async {
    loading = true;
    notifyListeners();

    final data = await DummyApiService.fetchAll();

    products = data['products'];
    orders = data['orders'];
    categories = data['category'];

    loading = false;
    notifyListeners();
  }
}
