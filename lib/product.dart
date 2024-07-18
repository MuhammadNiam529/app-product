class Product {
  final String image;
  final String title;
  final String price;

  Product({required this.image, required this.title, required this.price});

  // Fungsi factory untuk membuat instance Product dari dokumen Firestore
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      price: data['price'] ?? '',
    );
  }
}
