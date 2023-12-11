part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitialState extends ProductsState {
  const ProductsInitialState();
}

//^ get all products
final class GetProductsLoadingState extends ProductsState {}

final class GetProductsSuccessfullState extends ProductsState {
  final List<ProductModel> allProductslist;
  const GetProductsSuccessfullState({required this.allProductslist});
  @override
  List<Object> get props => [allProductslist];
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

//^ search products by mark

final class SearchProductsSuccessfullState extends ProductsState {
  final List<ProductModel> productslist;
  const SearchProductsSuccessfullState({required this.productslist});
  @override
  List<Object> get props => [productslist];
}

final class SearchProductsLoadingState extends ProductsState {}

final class SearchProductsFailureState extends ProductsState {
  final String failMsg;
  const SearchProductsFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class SearchProductsEmptyState extends ProductsState {
  final String emptyMsg;
  const SearchProductsEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}
