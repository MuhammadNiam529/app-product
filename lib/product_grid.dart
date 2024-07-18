import 'package:flutter/material.dart';
import 'product.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onDelete;
  final Function(Product) onEdit;

  ProductGrid(
      {required this.products, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2, // Sesuaikan sesuai kebutuhan Anda
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onDelete: () => onDelete(products[index]),
          onEdit: () => onEdit(products[index]),
        );
      },
    );
  }
}
