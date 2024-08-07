import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';
import 'product_grid.dart';
import 'add_product_screen.dart';
import 'edit_product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        _products = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          return Product(
            id: doc.id,
            image: data['image'],
            title: data['title'],
            price: data['price'],
          );
        }).toList();
      });
    });
  }

  void _addProduct() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );

    if (result != null) {
      setState(() {
        _products.add(Product.fromFirestore(result));
      });
    }
  }

  void _deleteProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .delete();
    setState(() {
      _products.remove(product);
    });
  }

  void _editProduct(Product product) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProductScreen(product: product)),
    );

    if (result != null) {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .update(result);
      setState(() {
        _products[_products.indexWhere((element) => element.id == product.id)] =
            Product.fromFirestore(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tokoku',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Aksi saat tombol pencarian ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: _addProduct,
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
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Aksi saat tombol "See More" ditekan
                  },
                  child: Text(
                    'See More',
                    style: TextStyle(fontSize: 14.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ProductGrid(
              products: _products,
              onDelete: _deleteProduct,
              onEdit: _editProduct,
            ),
          ),
        ],
      ),
    );
  }
}
