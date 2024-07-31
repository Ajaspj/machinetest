import 'package:bloc/bloc.dart';
import 'package:machinetest/api/apiservice.dart';
import 'package:machinetest/bloc/product_event.dart';
import 'package:machinetest/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await apiService.fetchProducts();
      if (products != null) {
        emit(ProductLoaded(products));
      } else {
        emit(const ProductError("Failed to fetch products"));
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
