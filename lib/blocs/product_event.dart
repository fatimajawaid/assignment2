import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

// Fetch all products
class FetchProducts extends ProductEvent {}

// Fetch products by category
class FetchProductsByCategory extends ProductEvent {
  final String category;

  const FetchProductsByCategory(this.category);

  @override
  List<Object> get props => [category];
}
