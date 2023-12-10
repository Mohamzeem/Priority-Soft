part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitialState extends CategoriesState {
  const CategoriesInitialState();
}

final class GetCategoriesLoadingState extends CategoriesState {}

final class GetCategoriesSuccessfullState extends CategoriesState {
  final List<CategoriesModel> categorieslist;
  const GetCategoriesSuccessfullState({required this.categorieslist});
  @override
  List<Object> get props => [categorieslist];
}

final class GetCategoriesFailureState extends CategoriesState {
  final String failMsg;
  const GetCategoriesFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class GetCategoriesEmptyState extends CategoriesState {
  final String emptyMsg;
  const GetCategoriesEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}
