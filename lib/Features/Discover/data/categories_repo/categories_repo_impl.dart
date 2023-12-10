import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/categories_model.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_api.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesApi api;
  CategoriesRepoImpl({required this.api});
  @override
  Future<Either<String, List<CategoriesModel>>> getCategories() async {
    try {
      final result = await api.getcategories();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
