import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_repo_impl.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepoImpl repoImpl;
  ProductsCubit({required this.repoImpl}) : super(const ProductsInitialState());

  Future<void> getProducts() async {
    final result = await repoImpl.getProducts();
    result.fold((failure) => emit(GetProductsFailureState(failMsg: failure)),
        (products) {
      if (products.isEmpty) {
        emit(const GetProductsEmptyState(emptyMsg: 'No Products were found'));
        return;
      }
      emit(GetProductsSuccessfullState(productslist: products));
    });
  }
}
