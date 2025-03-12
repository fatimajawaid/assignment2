import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_state.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';
import '../repository/product_repository.dart';
import '../services/api_service.dart';
import '../blocs/product_event.dart';
import '../views/search_delegate.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Shop', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          CategoryList(
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
              context.read<ProductBloc>().add(FetchProductsByCategory(category));
            },
          ),
          SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: state.products[index]);
                    },
                  );
                } else {
                  return Center(child: Text('Failed to load products'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}