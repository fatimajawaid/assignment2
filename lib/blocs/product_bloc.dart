import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService = ApiService(); // Use API Service directly

  ProductBloc() : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('An error occurred while fetching products'));
      }
    });

    on<FetchProductsByCategory>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProductsByCategory(event.category);
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('An error occurred while fetching products'));
      }
    });
  }
}
