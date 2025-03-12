class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final String image;
  final String description;
  final double rating; // Add this field
  final int ratingCount; // Add this field

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    required this.rating, // Include in constructor
    required this.ratingCount, // Include in constructor
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      description: json['description'],
      rating: (json['rating']['rate'] as num).toDouble(), // Fetch rating
      ratingCount: json['rating']['count'], // Fetch number of ratings
    );
  }
}
