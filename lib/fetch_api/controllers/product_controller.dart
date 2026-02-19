import 'package:flutter/foundation.dart';
import 'package:test_code/fetch_api/models/product_model.dart';
import '../core/network/api_client.dart';
import '../core/constants/endpoints.dart';

class ProductController extends ChangeNotifier {
  final ApiClient apiClient;

  ProductController(this.apiClient);

  bool _loading = false;
  List<Product> _products = [];
  String? _error;

  bool get loading => _loading;
  List<Product> get products => _products;
  String? get error => _error;

  /// Fetch products from API
  Future<void> fetchProducts() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final res = await apiClient.get(Endpoints.products);

      if (res['products'] != null) {
        final List productList = res['products'];
        _products = productList.map((e) => Product.fromJson(e)).toList();
      } else {
        _error = 'No products found';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
