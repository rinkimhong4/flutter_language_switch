import 'package:flutter/material.dart';
import 'package:test_code/fetch_api/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title!)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 Hero Image
            Hero(
              tag: "product_${product.id}",
              child: CachedNetworkImage(
                imageUrl: product.thumbnail!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  height: 300,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 300,
                  child: Center(
                    child: Icon(Icons.image_not_supported, size: 60),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷 Title
                  Text(
                    product.title!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 💰 Price & Discount
                  Row(
                    children: [
                      Text(
                        "\$${product.price!.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      if (product.discountPercentage != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${product.discountPercentage!.toStringAsFixed(1)}% OFF",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // 🏭 Brand
                  Text(
                    "Brand: ${product.brand}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ⭐ Rating
                  if (product.rating != null)
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: product.rating!,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 8),
                        Text("(${product.rating})"),
                      ],
                    ),

                  const SizedBox(height: 12),

                  // 📦 Stock
                  Text(
                    "Stock: ${product.stock}",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 12),

                  // 📏 Dimensions
                  if (product.dimensions != null)
                    Text(
                      "Dimensions: ${product.dimensions!.width} x ${product.dimensions!.height} x ${product.dimensions!.depth} cm",
                      style: const TextStyle(fontSize: 16),
                    ),

                  const SizedBox(height: 12),

                  // 🏷 Tags
                  if (product.tags != null && product.tags!.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: product.tags!
                          .map((tag) => Chip(label: Text(tag)))
                          .toList(),
                    ),

                  const SizedBox(height: 12),

                  // 📝 Description
                  Text(
                    product.description!,
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 20),

                  // 💬 Reviews
                  if (product.reviews != null && product.reviews!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...product.reviews!.map(
                          (review) => Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              title: Text(review.reviewerName ?? "Anonymous"),
                              subtitle: Text(review.comment ?? ""),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  review.rating ?? 0,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
