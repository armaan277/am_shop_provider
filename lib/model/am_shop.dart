class Product {
  final int id;
  final String title;
  final String description;
  final num price;
  final String category;
  final String image;
  final Rating rating;

  const Product({
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

class Rating {
  final num rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map mapRating) {
    return Rating(
      rate: mapRating['rate'] ?? 0,
      count: mapRating['count'] ?? 0,
    );
  }
}
