import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/models/categories_model.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_repo_impl.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepoImpl repoImpl;
  CategoriesCubit({required this.repoImpl})
      : super(const CategoriesInitialState());

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await repoImpl.getCategories();
    result.fold((failure) => emit(GetCategoriesFailureState(failMsg: failure)),
        (categories) {
      if (categories.isEmpty) {
        emit(const GetCategoriesEmptyState(
            emptyMsg: 'No Categories were found'));
        return;
      }
      emit(GetCategoriesSuccessfullState(categorieslist: categories));
    });
  }
}
