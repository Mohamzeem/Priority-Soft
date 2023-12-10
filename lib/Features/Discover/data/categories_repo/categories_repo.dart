import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/categories_model.dart';

abstract class CategoriesRepo {
  Future<Either<String, List<CategoriesModel>>> getCategories();
}
