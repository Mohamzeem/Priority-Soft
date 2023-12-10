part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitialState extends ProductsState {
  const ProductsInitialState();
}

final class GetProductsLoadingState extends ProductsState {}

final class GetProductsSuccessfullState extends ProductsState {
  final List<ProductModel> productslist;
  const GetProductsSuccessfullState({required this.productslist});
  @override
  List<Object> get props => [productslist];
}

final class GetProductsFailureState extends ProductsState {
  final String failMsg;
  const GetProductsFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class GetProductsEmptyState extends ProductsState {
  final String emptyMsg;
  const GetProductsEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}
