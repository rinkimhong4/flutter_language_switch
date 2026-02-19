import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/fetch_api/controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: use_build_context_synchronously
    Future.microtask(() => context.read<ProductController>().fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: controller.products[index]);
        },
      ),
    );
  }
}
