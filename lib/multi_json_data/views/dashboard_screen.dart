import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/multi_json_data/controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Consumer<DashboardController>(
        builder: (context, c, _) {
          if (c.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Products: ${c.products.length}"),
                Text("Orders: ${c.orders.length}"),
                Text("Categories: ${c.categories.length}"),

                const SizedBox(height: 30),

                // 🔵 Products Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProductsScreen()),
                    );
                  },
                  child: const Text("Go to Products"),
                ),

                const SizedBox(height: 12),

                // 🟢 Orders Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrdersScreen()),
                    );
                  },
                  child: const Text("Go to Orders"),
                ),

                const SizedBox(height: 12),

                // 🟠 Categories Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoriesScreen(),
                      ),
                    );
                  },
                  child: const Text("Go to Categories"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<DashboardController>(
              builder: (context, c, _) => TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: c.searchProducts,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<DashboardController>(
        builder: (context, c, _) {
          if (c.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (c.products.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          return ListView.builder(
            itemCount: c.products.length,
            itemBuilder: (context, index) {
              final p = c.products[index];
              return ListTile(
                leading: CachedNetworkImage(
                  width: 50,
                  height: 50,
                  imageUrl: p.thumbnail,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                title: Text(p.title),
                subtitle: Text("\$${p.price}"),
              );
            },
          );
        },
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<DashboardController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: ListView.builder(
        itemCount: c.orders.length,
        itemBuilder: (context, index) {
          final o = c.orders[index];
          return ListTile(
            title: Text("Order #${o.id}"),
            subtitle: Text("Total: \$${o.total}"),
            trailing: Text("Items: ${o.totalProducts}"),
          );
        },
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.read<DashboardController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: ListView.builder(
        itemCount: c.categories.length,
        itemBuilder: (context, index) {
          final cat = c.categories[index];
          return ListTile(
            leading: const Icon(Icons.category),
            title: Text(cat.name),
            subtitle: Text(cat.slug),
          );
        },
      ),
    );
  }
}
