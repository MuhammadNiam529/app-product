class Product {
  final String id;
  final String image;
  final String title;
  final String price;

  Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.price});

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      image: data['image'],
      title: data['title'],
      price: data['price'],
    );
  }
}
