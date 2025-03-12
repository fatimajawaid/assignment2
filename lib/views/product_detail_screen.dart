import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product.image, height: 350, width: double.infinity, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 5),
              Row(
  children: [
    ...List.generate(5, (index) {
      return Icon(
        Icons.star,
        size: 16,
        color: index < product.rating.toInt() ? Colors.orange : Colors.grey,
      );
    }),
    SizedBox(width: 5), // Space between stars and rating count
    Text(
      '(${product.ratingCount})',
      style: TextStyle(fontSize: 14, color: Colors.grey),
    ),
  ],
),

              SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}