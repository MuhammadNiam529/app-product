import 'package:flutter/material.dart';
import 'product.dart';
import 'product_grid.dart';

void main() {
  List<Product> products = [
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 1',
      price: '\$10.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 2',
      price: '\$20.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 3',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 4',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 5',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 6',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 7',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 8',
      price: '\$30.00',
    ),
    Product(
      image: 'images/product1.jpeg',
      title: 'Kaos Bloods 9',
      price: '\$30.00',
    ),
    // tambahkan produk lain di sini...
  ];

  runApp(MyApp(products: products));
}

class MyApp extends StatelessWidget {
  final List<Product> products;

  MyApp({required this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Tokoku',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // Aksi saat tombol pencarian ditekan
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Aksi saat tombol "See More" ditekan
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ProductGrid(products: products),
            ),
          ],
        ),
      ),
    );
  }
}
