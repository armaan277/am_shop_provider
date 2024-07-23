import 'product_rating.dart';

class Product {
  final int id;
  final String title;
  final String description;
   num price;
  final String category;
  final String image;
  final Rating rating;

   Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromMap(Map productMap) {
    return Product(
      id: productMap['id'],
      title: productMap['title'],
      description: productMap['description'],
      price: productMap['price'],
      category: productMap['category'],
      image: productMap['image'],
      rating: Rating.fromMap(productMap['rating']),
    );
  }
}

