import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;
  final List<String> categories = ['All', 'electronics', 'jewelery', "men's clothing", "women's clothing"];

  CategoryList({required this.selectedCategory, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = categories[index] == selectedCategory;
          return GestureDetector(
            onTap: () => onCategorySelected(categories[index]),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Color.fromARGB(255, 207, 187, 243) : Color.fromARGB(255, 244, 230, 255),
                border: Border.all(color: Color.fromARGB(255, 193, 193, 195), width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.check, color: Color.fromARGB(255, 36, 34, 34), size: 16),
                    ),
                  Text(
                    categories[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: isSelected ? Colors.black : Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}