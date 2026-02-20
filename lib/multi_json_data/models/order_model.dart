class Order {
  final int id;
  final double total;
  final int totalProducts;

  Order({required this.id, required this.total, required this.totalProducts});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      total: (json['total'] as num).toDouble(),
      totalProducts: json['totalProducts'],
    );
  }
}
