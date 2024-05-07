import 'package:flutter/material.dart';
import 'product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        products.length,
        (index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}
