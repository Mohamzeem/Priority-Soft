import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_api.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsApi api;
  ProductsRepoImpl({required this.api});

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final result = await api.getProducts();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> searchProductsByMark(
      {required String mark}) async {
    try {
      final result = await api.searchProductsByMark(mark: mark);
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
